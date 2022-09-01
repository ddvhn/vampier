//
//  BaseWindowSceneAware.swift
//  Vampier
//
//  Created by Den on 08.10.2020.
//

import UIKit

@available(iOS 13.0, *)
open class BaseWindowSceneAware: IWindowSceneAware {

    public let windowScene: UIWindowScene

    init (windowScene: UIWindowScene) {

        assert(Thread.isMainThread)
        
        self.windowScene = windowScene
    }
}
