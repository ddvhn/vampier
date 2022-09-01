//
//  BaseViewController.swift
//  Vampier
//
//  Created by Den on 06.10.2020.
//

import UIKit

open class BaseViewController: UIViewController, IViewInterface {

    public var viewController: UIViewController { self }
    private(set) public var module: IModule!
}


// MARK: - IViewInterfaceModuleAware

extension BaseViewController {

    public func attach(to module: IModule) {

        assert(Thread.isMainThread)
        
        guard self.module == nil else { fatalError("'module' is attached already") }
        self.module = module
    }
}
