//
//  DefaultWindowFactory.swift
//  Vampier
//
//  Created by Den on 10.10.2020.
//

import UIKit

public final class DefaultWindowFactory: IWindowFactory {

    public init() {}
}


// MARK: - IWindowFactory

extension DefaultWindowFactory {

    public func createWindow() -> UIWindow {

        return UIWindow(frame: UIScreen.main.bounds)
    }
}
