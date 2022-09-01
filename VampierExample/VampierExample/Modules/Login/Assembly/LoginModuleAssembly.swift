//
//  
//  LoginModuleAssembly.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

class LoginModuleAssembly: BaseModuleAssembly, ILoginModuleAssembly {

    var homeModuleAsembly: IHomeModuleAssembly?

    override func factory() -> IModuleFactory {

        var factory: ILoginModuleFactory = LoginModuleFactory(windowRootViewControllerUpdateUnit: self.windowRootViewControllerUpdateUnit)
        
        /// NOTE: inject assembly dependencies into `factory` below
        assert(self.homeModuleAsembly != nil)
        factory.homeModuleAsembly = self.homeModuleAsembly

        return factory
    }
}
