//
//  DefaultWindowRootViewControllerUpdateUnit.swift
//  Vampier
//
//  Created by Den on 10.10.2020.
//

import UIKit

public final class DefaultWindowRootViewControllerUpdateUnit: IWindowRootViewControllerUpdateUnit {

    public let window: UIWindow
    public let windowFactory: IWindowFactory

    required public init (windowFactory: IWindowFactory) {

        self.window = windowFactory.createWindow()
        self.windowFactory = windowFactory
    }


    // MARK: - IWindowRootViewControllerUpdateUnit

    public func setRoot(viewController: UIViewController, animation: IWireframeRootPresentationTransitionAnimation, completion: VoidClosure?) {

        self.window.rootViewController = viewController

        if !self.window.isKeyWindow {
            self.window.makeKeyAndVisible()
        }

        let animated = animation != .none
        if animated {
            let duration: TimeInterval = 0.25
            let options: UIView.AnimationOptions

            switch animation {
            case .transitionCrossDissolve:
                options = .transitionCrossDissolve
                break
            case .transitionFlipFromLeft:
                options = .transitionFlipFromLeft
                break
            case .transitionFlipFromRight:
                options = .transitionFlipFromRight
                break
            case .none:
                assertionFailure("'animation' is .none")
                options = []
                break
            }

            UIView.transition(with: self.window, duration: duration, options: options, animations: {}, completion:
            { completed in
                if let completion = completion {
                    completion()
                }
            })
        } else {
            if let completion = completion {
                completion()
            }
        }
    }
}
