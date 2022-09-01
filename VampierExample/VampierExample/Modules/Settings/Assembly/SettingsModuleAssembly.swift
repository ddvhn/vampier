//
//  
//  SettingsModuleAssembly.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

class SettingsModuleAssembly: BaseModuleAssembly, ISettingsModuleAssembly {

    override func factory() -> IModuleFactory {

        let factory: ISettingsModuleFactory = SettingsModuleFactory(windowRootViewControllerUpdateUnit: self.windowRootViewControllerUpdateUnit)
        
        /// NOTE: inject assembly dependencies into `factory` below

        return factory
    }
}
