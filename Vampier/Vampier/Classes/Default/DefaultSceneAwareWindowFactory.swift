//
//  DefaultSceneAwareWindowFactory.swift
//  Vampier
//
//  Created by Den on 10.10.2020.
//

import UIKit

@available(iOS 13.0, *)
public final class DefaultSceneAwareWindowFactory: IWindowFactory {

    let windowScene: UIWindowScene

    init(windowScene: UIWindowScene) {

        self.windowScene = windowScene
    }
}


// MARK: - IWindowFactory

@available(iOS 13.0, *)
extension DefaultSceneAwareWindowFactory {

    public func createWindow() -> UIWindow {

        return UIWindow(windowScene: self.windowScene)
    }
}
