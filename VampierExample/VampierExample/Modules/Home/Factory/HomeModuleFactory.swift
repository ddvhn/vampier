//
//  
//  HomeModuleFactory.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

class HomeModuleFactory: BaseWindowRootViewControllerUpdateUnitAware, IHomeModuleFactory {

    var loginModuleAssembly: ILoginModuleAssembly?
    var settingsModuleAssembly: ISettingsModuleAssembly?
    var tabbarModuleAssembly: ITabbarModuleAssembly?

    func createModule(viewInterfaceHandler: (IViewInterface) -> ()) -> Result<IModule, IModuleFactoryError> {

        let viewInterface = HomeViewController()
        var wireframe: IHomeWireframe = HomeWireframe(viewInterface: viewInterface,
                                                      windowRootViewControllerUpdateUnit: self.windowRootViewControllerUpdateUnit)
        let presenter: IHomePresenter = HomePresenter(viewInterface: viewInterface,
                                                      wireframe: wireframe)
        let interactor: IHomeInteractor = HomeInteractor(presenter: presenter)

        viewInterface.eventHandler = presenter
        
        /// NOTE: inject assembly dependencies into `wireframe` below
        assert(self.settingsModuleAssembly != nil)
        wireframe.settingsModuleAssembly = self.settingsModuleAssembly
        assert(self.loginModuleAssembly != nil)
        wireframe.loginModuleAssembly = self.loginModuleAssembly
        assert(self.tabbarModuleAssembly != nil)
        wireframe.tabbarModuleAssembly = self.tabbarModuleAssembly

        let module: IHomeModule = HomeModule(viewInterface: viewInterface,
                                               interactor: interactor,
                                               presenter: presenter,
                                               wireframe: wireframe)
        viewInterfaceHandler(viewInterface)

        return .success(module)
    }
}
