//
//  VampierExampleApplicationBuilder.swift
//  VampierExample
//
//  Created by Den on 10.10.2020.
//

import UIKit
import Vampier

class VampierExampleApplicationBuilder: BaseApplicationBuilder {

    override func setUp(with windowRootViewControllerUpdateUnit: IWindowRootViewControllerUpdateUnit, completion: VoidClosure?) {

        var tabbarModuleAssembly: ITabbarModuleAssembly = TabbarModuleAssembly(windowRootViewControllerUpdateUnit: windowRootViewControllerUpdateUnit)

        let settingsModuleAssembly: ISettingsModuleAssembly = SettingsModuleAssembly(windowRootViewControllerUpdateUnit: windowRootViewControllerUpdateUnit)

        var homeModuleAssembly: IHomeModuleAssembly = HomeModuleAssembly(windowRootViewControllerUpdateUnit: windowRootViewControllerUpdateUnit)
        homeModuleAssembly.settingsModuleAssembly = settingsModuleAssembly
        homeModuleAssembly.tabbarModuleAssembly = tabbarModuleAssembly

        var loginModuleAssembly: ILoginModuleAssembly = LoginModuleAssembly(windowRootViewControllerUpdateUnit: windowRootViewControllerUpdateUnit)
        loginModuleAssembly.homeModuleAsembly = homeModuleAssembly
        homeModuleAssembly.loginModuleAssembly = loginModuleAssembly

        tabbarModuleAssembly.loginModuleAssembly = loginModuleAssembly
        tabbarModuleAssembly.homeModuleAssembly = homeModuleAssembly

        var splashModuleAssembly: ISplashModuleAssembly = SplashModuleAssembly(windowRootViewControllerUpdateUnit: windowRootViewControllerUpdateUnit)
        splashModuleAssembly.loginModuleAssembly = loginModuleAssembly
        splashModuleAssembly.homeModuleAssembly = homeModuleAssembly

        /// Root view controller
        splashModuleAssembly.factory().createModule() { viewInterface in
            viewInterface.module.wireframe.presentAsRoot(animation: .transitionCrossDissolve, completion: completion)
        }
    }
}
