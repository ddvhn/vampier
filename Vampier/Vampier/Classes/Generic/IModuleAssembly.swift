//
//  IModuleAssembly.swift
//  Vampier
//
//  Created by Den on 07.10.2020.
//

import Foundation

public protocol IModuleAssembly: IWindowRootViewControllerUpdateUnitAware {

    func factory() -> IModuleFactory
}
