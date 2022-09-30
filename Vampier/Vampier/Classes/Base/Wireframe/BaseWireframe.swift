//
//  BaseWireframe.swift
//  Vampier
//
//  Created by Den on 06.10.2020.
//

import UIKit

open class BaseWireframe: BaseModuleAware, IWireframe {

    public let windowRootViewControllerUpdateUnit: IWindowRootViewControllerUpdateUnit

    private(set) weak public var viewInterface: IViewInterface?
    private(set) public var presentationType: IWireframePresentationType = .none

    private(set) weak public var nextWireframe: IWireframe?
    private(set) weak public var parentWireframe: IWireframe?

    public let containedWireframes: [IWireframe]
    private let containedViewInterfaces: [IViewInterface]

    private let navigationAwareUnit: INavigationAwareUnit = DefaultNavigationAwareUnit()

    required public init(viewInterface: IViewInterface, windowRootViewControllerUpdateUnit: IWindowRootViewControllerUpdateUnit) {

        assert(Thread.isMainThread)

        guard (viewInterface.viewController as? UINavigationController) == nil else {
            fatalError("'viewController' MUST NOT be an instance of 'UINavigationController'")
        }

        self.viewInterface = viewInterface
        self.windowRootViewControllerUpdateUnit = windowRootViewControllerUpdateUnit
        self.containedWireframes = []
        self.containedViewInterfaces = []
    }

    public init (viewInterface: IViewInterface, containedWireframes: [IWireframe], windowRootViewControllerUpdateUnit: IWindowRootViewControllerUpdateUnit) {

        assert(Thread.isMainThread)

        guard (viewInterface.viewController as? UINavigationController) == nil else {
            fatalError("'viewController' MUST NOT be an instance of 'UINavigationController'")
        }

        self.viewInterface = viewInterface
        self.windowRootViewControllerUpdateUnit = windowRootViewControllerUpdateUnit

        assert(containedWireframes.count > 0, "'containedWireframes.count' is 0")
        self.containedWireframes = containedWireframes
        self.containedViewInterfaces = containedWireframes.compactMap {
            assert($0.viewInterface != nil, "'viewInterface' is nil")
            return $0.viewInterface
        }

        super.init()

        containedWireframes.forEach {
            guard let containedWireframe = ($0 as? BaseWireframe) else {
                assertionFailure("'containedWireframe' MUST be an instance of 'BaseWireframe'")
                return
            }
            containedWireframe.attach(to: self, presentationType: .contained)
        }

        assert(self.containedViewInterfaces.count == containedWireframes.count)
    }
}


// MARK: - IWireframe

extension BaseWireframe {

    public func push(wireframe: IWireframe, animated: Bool, completion: VoidClosure?) {

        assert(Thread.isMainThread)

        guard let wireframe = wireframe as? BaseWireframe else {
            assertionFailure("'containedWireframe' MUST be an instance of 'BaseWireframe'")
            return
        }

        guard let wireframeViewInterface = wireframe.viewInterface else {
            assertionFailure("'wireframe.viewInterface' is nil")
            return
        }

        guard let parentViewController = self.viewInterface?.viewController else {
            assertionFailure("'self.viewInterface' is nil")
            return
        }

        guard let navigationController = parentViewController.navigationController else {
            assertionFailure("'navigationController' is nil")
            return
        }

        wireframe.attach(to: self, presentationType: .navigation)

        self.navigationAwareUnit.push(viewController: wireframeViewInterface.viewController,
                                      to: navigationController,
                                      animated: animated, completion: completion)
    }

    public func present(wireframe: IWireframe, animated: Bool, completion: VoidClosure?) {

        assert(Thread.isMainThread)

        self.present(wireframe: wireframe, animated: animated, inNavigationContainer: true, completion: completion)
    }

    public func present(wireframe: IWireframe, animated: Bool, inNavigationContainer: Bool, completion: VoidClosure?) {

        assert(Thread.isMainThread)

        guard let wireframe = wireframe as? BaseWireframe else {
            assertionFailure("'containedWireframe' MUST be an instance of 'BaseWireframe'")
            return
        }

        guard let wireframeViewController = wireframe.viewInterface?.viewController else {
            assertionFailure("'wireframe.viewInterface' is nil")
            return
        }

        guard let parentViewController = self.viewInterface?.viewController else {
            assertionFailure("'self.viewInterface' is nil")
            return
        }

        wireframe.attach(to: self, presentationType: .modal)

        let viewControllerToPresent: UIViewController

        if inNavigationContainer {
            viewControllerToPresent = UINavigationController(rootViewController: wireframeViewController)
        } else {
            viewControllerToPresent = wireframeViewController
        }

        parentViewController.present(viewControllerToPresent, animated: animated, completion: completion)
    }

    public func presentAsRoot(animation: IWireframeRootPresentationTransitionAnimation, completion: VoidClosure?) {

        guard let viewInterface = self.viewInterface else {
            assertionFailure("'self.viewInterface' is nil")
            return
        }

        self.deattach()
        self.presentationType = .root

        let navigationController = UINavigationController(rootViewController: viewInterface.viewController)

        self.windowRootViewControllerUpdateUnit.setRoot(viewController: navigationController,
                                                        animation: animation,
                                                        completion: completion)
    }

    public func dismiss(animated: Bool, completion: VoidClosure?) {

        assert(Thread.isMainThread)
        
        guard let viewInterface = self.viewInterface else {
            assertionFailure("'self.viewInterface' is nil")
            return
        }

        let viewController = viewInterface.viewController

        switch self.presentationType {
        case .none:
            assertionFailure("can't dismiss - wireframe isn't presented")
            break
        case .root:
            assertionFailure("can't dismiss - wireframe is root")
            break
        case .contained:
            assertionFailure("can't dismiss - wireframe is contained")
            break
        case .modal:
            self.deattach()
            viewController.dismiss(animated: animated, completion: completion)
            break
        case .navigation:
            guard let navigationController = viewController.navigationController else {
                assertionFailure("'viewController.navigationController' is nil")
                return
            }
            self.deattach()
            self.navigationAwareUnit.pop(viewController: viewController,
                                         from: navigationController,
                                         animated: animated,
                                         completion: completion)
            break
        }
    }
}


// MARK: - Private

private extension BaseWireframe {

    private func attach(to parent: BaseWireframe, presentationType: IWireframePresentationType) {

        assert(Thread.isMainThread)

        guard presentationType != .none else {
            assertionFailure("'presentationType' is invalid: .none")
            return
        }

        guard presentationType != .root else {
            assertionFailure("'presentationType' is invalid: .root")
            return
        }

        guard parent.nextWireframe == nil else {
            assertionFailure("'parent.nextWireframe' isn't nil")
            return
        }

        guard self.parentWireframe == nil else {
            assertionFailure("'self.parentWireframe' isn't nil")
            return
        }

        if presentationType != .contained {
            parent.nextWireframe = self
        }

        self.parentWireframe = parent
        self.presentationType = presentationType
    }

    private func deattach() {

        assert(Thread.isMainThread)

        guard self.parentWireframe != nil else {
            /// isn't attached
            return
        }

        guard let parent = self.parentWireframe as? BaseWireframe else {
            assertionFailure("'self.parentWireframe' MUST be an instance of 'BaseWireframe'")
            return
        }

        guard self.presentationType != .none else {
            assertionFailure("'presentationType' is invalid: .none")
            assert(self.parentWireframe == nil)
            return
        }

        guard self.presentationType != .root else {
            assertionFailure("'presentationType' is invalid: .root")
            return
        }

        guard self.presentationType != .contained else {
            assertionFailure("'presentationType' is invalid: .contained")
            return
        }

        if parent.nextWireframe === self {
            parent.nextWireframe = nil
        } else {
            assertionFailure("'parent.nextWireframe' MUST be equal to 'self'")
        }

        self.parentWireframe = nil
        self.presentationType = .none
    }
}
