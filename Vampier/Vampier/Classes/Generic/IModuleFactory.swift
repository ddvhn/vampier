//
//  IModuleFactory.swift
//  Vampier
//
//  Created by Den on 06.10.2020.
//

import Foundation

public enum IModuleFactoryError: Error {
    
    case `internal`
    case missingRequiredDataParameters
    case missingRequiredAssemblyDependencies
}

public protocol IModuleFactory: IWindowRootViewControllerUpdateUnitAware {

    @discardableResult
    func createModule(viewInterfaceHandler: (IViewInterface) -> ()) -> Result<IModule, IModuleFactoryError>
}
