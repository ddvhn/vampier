//
//  BaseModuleAssembly.swift
//  Vampier
//
//  Created by Den on 08.10.2020.
//

import Foundation

open class BaseModuleAssembly: BaseWindowRootViewControllerUpdateUnitAware, IModuleAssembly {


    // MARK: - IModuleAssembly

    open func factory() -> IModuleFactory {

        fatalError("'factory()' MUST be overriden")
    }
}
