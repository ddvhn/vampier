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

    private weak var delegate: IWireframeHierarchyDelegate?
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

    public func setHierarchyDelegate(_ delegate: IWireframeHierarchyDelegate?) {

        self.delegate = delegate
    }

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

        assert(Thread.isMainThread)

        guard let viewInterface = self.viewInterface else {
            assertionFailure("'self.viewInterface' is nil")
            return
        }

        self.detachFromParent()
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
        case .root:
            assertionFailure("can't dismiss - wireframe is root")
        case .contained:
            assertionFailure("can't dismiss - wireframe is contained")
        case .modal:
            self.detachFromParent()
            if let presentingViewController = viewController.presentingViewController {
                presentingViewController.dismiss(animated: animated, completion: completion)
            } else {
                if !viewController.isBeingPresented {
                    assertionFailure("'presentingViewController' is nil")
                }
                viewController.dismiss(animated: animated, completion: completion)
            }
        case .navigation:
            guard let navigationController = viewController.navigationController else {
                assertionFailure("'viewController.navigationController' is nil")
                return
            }
            self.detachFromParent()
            self.navigationAwareUnit.pop(viewController: viewController, from: navigationController, animated: animated, completion: completion)
        }
    }
}


// MARK: - Private

private extension BaseWireframe {

    private func attach(to parent: IWireframe, presentationType: IWireframePresentationType) {

        assert(Thread.isMainThread)

        guard presentationType != .none else {
            assertionFailure("'presentationType' is invalid: .none")
            return
        }

        guard presentationType != .root else {
            assertionFailure("'presentationType' is invalid: .root")
            return
        }

        assert(self.presentationType == .none)

        guard self.parentWireframe == nil else {
            assertionFailure("'self.parentWireframe' isn't nil")
            return
        }

        guard let parent = parent as? BaseWireframe else {
            assertionFailure("'parent' MUST be an instance of 'BaseWireframe'")
            return
        }

        if presentationType != .contained {
            parent.setNextWireframe(self, presentationType: presentationType)
        }

        self.parentWireframe = parent
        self.presentationType = presentationType
    }

    func detachFromParent() {

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

        parent.unsetNextWireframe(self)

        self.parentWireframe = nil
        self.presentationType = .none
    }

    private func setNextWireframe(_ child: IWireframe, presentationType: IWireframePresentationType) {

        assert(Thread.isMainThread)

        guard self.nextWireframe == nil else {
            assertionFailure("'self.nextWireframe' isn't nil")
            return
        }

        guard child.parentWireframe == nil else {
            assertionFailure("'child.parentWireframe' isn't nil")
            return
        }

        self.notifyWillAttachChildWireframe(child, withPresentation: presentationType)

        self.nextWireframe = child
    }

    private func unsetNextWireframe(_ child: IWireframe) {

        assert(Thread.isMainThread)

        guard self.nextWireframe != nil else {
            assertionFailure("'self.nextWireframe' is nil")
            return
        }

        guard let nextWireframe = self.nextWireframe, nextWireframe === child else {
            assertionFailure("'nextWireframe' MUST be equal to 'child'")
            return
        }

        guard child.parentWireframe === self else {
            assertionFailure("'child.parentWireframe' MUST be equal to 'self'")
            return
        }

        guard child.presentationType != .none else {
            assertionFailure("'presentationType' is invalid: .none")
            assert(self.parentWireframe == nil)
            return
        }

        guard child.presentationType != .root else {
            assertionFailure("'presentationType' is invalid: .root")
            return
        }

        guard child.presentationType != .contained else {
            assertionFailure("'presentationType' is invalid: .contained")
            return
        }

        self.notifyWillDetachChildWireframe(child)

        self.nextWireframe = nil
    }

    func notifyWillAttachChildWireframe(_ child: IWireframe, withPresentation type: IWireframePresentationType) {

        assert(Thread.isMainThread)

        if let delegate = self.delegate {
            delegate.wireframe(self, hierarchyWillAttachChildWireframe: child, withPresentation: type)
        }

        guard let parent = self.parentWireframe else {
            return
        }

        guard let parent = parent as? BaseWireframe else {
            assertionFailure("'parent' MUST be an instance of 'BaseWireframe'")
            return
        }

        parent.notifyWillAttachChildWireframe(child, withPresentation: type)
    }

    func notifyWillDetachChildWireframe(_ child: IWireframe) {

        assert(Thread.isMainThread)
        
        if let delegate = self.delegate {
            delegate.wireframe(self, hierarchyWillDetachChildWireframe: child)
        }

        guard let parent = self.parentWireframe else {
            return
        }

        guard let parent = parent as? BaseWireframe else {
            assertionFailure("'parent' MUST be an instance of 'BaseWireframe'")
            return
        }

        parent.notifyWillDetachChildWireframe(child)
    }
}
