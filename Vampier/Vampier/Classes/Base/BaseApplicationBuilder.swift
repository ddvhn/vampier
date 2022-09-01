//
//  BaseApplicationBuilder.swift
//  Vampier
//
//  Created by Den on 15.10.2020.
//

import UIKit

open class BaseApplicationBuilder: IApplicatonBuilder {

    public init() {}

    public func build() {

        self.build(with: nil)
    }

    public func build(with completion: VoidClosure?) {

        if #available(iOS 13.0, *) {
            fatalError("'start(using:)' MUST be called if running iOS 13+")
        }

        self.build(using: DefaultWindowFactory(), completion: completion)
    }

    @available(iOS 13.0, *)
    public func build(using windowScene: UIWindowScene) {

        self.build(using: windowScene, completion: nil)
    }

    @available(iOS 13.0, *)
    public func build(using windowScene: UIWindowScene, completion: VoidClosure?) {

        self.build(using: DefaultSceneAwareWindowFactory(windowScene: windowScene), completion: completion)
    }

    public func build(using windowFactory: IWindowFactory) {

        self.build(using: windowFactory, completion: nil)
    }

    public func build(using windowFactory: IWindowFactory, completion: VoidClosure?) {

        let windowRootViewControllerUpdateUnit: IWindowRootViewControllerUpdateUnit = DefaultWindowRootViewControllerUpdateUnit(windowFactory: windowFactory)

        self.setUp(with: windowRootViewControllerUpdateUnit, completion: completion)
    }

    open func setUp(with windowRootViewControllerUpdateUnit: IWindowRootViewControllerUpdateUnit, completion: VoidClosure?) {

        assertionFailure("'setUp(with:completion:)' MUST be overriden")
    }
}
