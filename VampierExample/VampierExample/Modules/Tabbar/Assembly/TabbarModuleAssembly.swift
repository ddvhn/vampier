//
//  
//  TabbarModuleAssembly.swift
//  VampierExample
//
//  Created by Den on 13.10.2020.
//
//

import Foundation
import Vampier

class TabbarModuleAssembly: BaseModuleAssembly, ITabbarModuleAssembly {

    var loginModuleAssembly: ILoginModuleAssembly?
    var homeModuleAssembly: IHomeModuleAssembly?

    override func factory() -> IModuleFactory {

        var factory: ITabbarModuleFactory = TabbarModuleFactory(windowRootViewControllerUpdateUnit: self.windowRootViewControllerUpdateUnit)
        
        /// NOTE: inject assembly dependencies into `factory` below
        factory.loginModuleAssembly = self.loginModuleAssembly
        factory.homeModuleAssembly = self.homeModuleAssembly

        return factory
    }
}
