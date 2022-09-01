//
//  DefaultNavigationAwareUnit.swift
//  Vampier
//
//  Created by Den on 09.10.2020.
//

import UIKit

public final class DefaultNavigationAwareUnit: NSObject {

    private(set) var transactionContext: INavigationAwareUnitTransactionContext? = nil

    public override init() {}
}


// MARK: - INavigationAwareUnit

extension DefaultNavigationAwareUnit: INavigationAwareUnit {

    func push(viewController: UIViewController, to navigationController: UINavigationController, animated: Bool, completion: VoidClosure?) {

        assert(Thread.isMainThread)

        guard self.transactionContext == nil else {
            assertionFailure("'self.transactionContext' isn't nil")
            return
        }

        self.transactionContext = .push(viewController, completion)

        navigationController.delegate = self
        navigationController.pushViewController(viewController, animated: animated)
    }

    func pop(viewController: UIViewController, from navigationController: UINavigationController, animated: Bool, completion: VoidClosure?) {

        assert(Thread.isMainThread)

        guard self.transactionContext == nil else {
            assertionFailure("'self.transactionContext' isn't nil")
            return
        }

        let firstIndex: Int? = navigationController.viewControllers.firstIndex(of: viewController)

        guard let index = firstIndex else {
            assertionFailure("'viewController' wasn't found inside 'navigationController.viewControllers' list")
            return
        }

        guard index > 0 else {
            assertionFailure("minimum of 2 view controllers should be inside navigation controller to perfrom dismiss")
            return
        }

        let toViewController = navigationController.viewControllers[index-1]
        self.transactionContext = .pop(toViewController, completion)

        navigationController.delegate = self
        navigationController.popToViewController(toViewController, animated: animated)
    }
}


// MARK: - UINavigationControllerDelegate

extension DefaultNavigationAwareUnit: UINavigationControllerDelegate {

    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {

        assert(Thread.isMainThread)

        guard let transactionContext = self.transactionContext else { return }

        guard let expectedViewControllerToAppear = transactionContext.expectedViewControllerToAppear else {
            assertionFailure("'transactionContext.expectedViewControllerToAppear' is nil")
            return
        }

        guard let rootViewController = navigationController.viewControllers.first else {
            assertionFailure("'navigationController.viewControllers.first' is nil")
            return
        }

        /// note: might occur when pushing another view controller with animation at app launch (when the view hierarchy isn't fully set)
        if viewController == rootViewController {
            return
        }

        guard expectedViewControllerToAppear == viewController else {
            assertionFailure("expectedViewControllerToAppear != viewController")
            return
        }

        self.transactionContext = nil

        if let completion = transactionContext.completion {
            completion()
        }
    }
}
