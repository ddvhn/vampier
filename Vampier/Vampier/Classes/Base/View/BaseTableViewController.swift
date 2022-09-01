//
//  BaseTableViewController.swift
//  Vampier
//
//  Created by Den on 06.10.2020.
//

import UIKit

open class BaseTableViewController: UITableViewController, IViewInterface {

    public var viewController: UIViewController { self }
    private(set) public var module: IModule!
}


// MARK: - IViewInterfaceModuleAware

extension BaseTableViewController {

    public func attach(to module: IModule) {

        assert(Thread.isMainThread)
        
        guard self.module == nil else { fatalError("'module' is attached already") }
        self.module = module
    }
}
