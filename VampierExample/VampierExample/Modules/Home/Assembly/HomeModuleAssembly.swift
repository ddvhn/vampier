//
//  
//  HomeModuleAssembly.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

class HomeModuleAssembly: BaseModuleAssembly, IHomeModuleAssembly {

    var settingsModuleAssembly: ISettingsModuleAssembly?
    var loginModuleAssembly: ILoginModuleAssembly?
    var tabbarModuleAssembly: ITabbarModuleAssembly?

    override func factory() -> IModuleFactory {

        var factory: IHomeModuleFactory = HomeModuleFactory(windowRootViewControllerUpdateUnit: self.windowRootViewControllerUpdateUnit)
        
        /// NOTE: inject assembly dependencies into `factory` below
        assert(self.settingsModuleAssembly != nil)
        factory.settingsModuleAssembly = self.settingsModuleAssembly
        assert(self.loginModuleAssembly != nil)
        factory.loginModuleAssembly = self.loginModuleAssembly
        assert(self.tabbarModuleAssembly != nil)
        factory.tabbarModuleAssembly = self.tabbarModuleAssembly

        return factory
    }
}
