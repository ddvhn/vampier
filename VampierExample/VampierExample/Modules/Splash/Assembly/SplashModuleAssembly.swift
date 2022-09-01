//
//  
//  SplashModuleAssembly.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

class SplashModuleAssembly: BaseModuleAssembly, ISplashModuleAssembly {

    var loginModuleAssembly: ILoginModuleAssembly?
    var homeModuleAssembly: IHomeModuleAssembly?

    override func factory() -> IModuleFactory {

        var factory: ISplashModuleFactory = SplashModuleFactory(windowRootViewControllerUpdateUnit: self.windowRootViewControllerUpdateUnit)
        
        /// NOTE: inject assembly dependencies into `factory` below
        assert(self.loginModuleAssembly != nil)
        factory.loginModuleAssembly = self.loginModuleAssembly
        assert(self.homeModuleAssembly != nil)
        factory.homeModuleAssembly = self.homeModuleAssembly

        return factory
    }
}
