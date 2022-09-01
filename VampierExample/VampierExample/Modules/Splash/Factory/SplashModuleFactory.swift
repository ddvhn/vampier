//
//  
//  SplashModuleFactory.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

class SplashModuleFactory: BaseWindowRootViewControllerUpdateUnitAware, ISplashModuleFactory {

    var loginModuleAssembly: ILoginModuleAssembly?
    var homeModuleAssembly: IHomeModuleAssembly?

    func createModule(viewInterfaceHandler: (IViewInterface) -> ()) -> Result<IModule, IModuleFactoryError> {

        let viewInterface = SplashViewController()
        var wireframe: ISplashWireframe = SplashWireframe(viewInterface: viewInterface,
                                                          windowRootViewControllerUpdateUnit: self.windowRootViewControllerUpdateUnit)
        let presenter: ISplashPresenter = SplashPresenter(viewInterface: viewInterface,
                                                          wireframe: wireframe)
        let interactor: ISplashInteractor = SplashInteractor(presenter: presenter)

        viewInterface.eventHandler = presenter
        
        /// NOTE: inject assembly dependencies into `wireframe` below
        assert(self.loginModuleAssembly != nil)
        wireframe.loginModuleAssembly = self.loginModuleAssembly
        assert(self.homeModuleAssembly != nil)
        wireframe.homeModuleAssembly = self.homeModuleAssembly

        let module: ISplashModule = SplashModule(viewInterface: viewInterface,
                                               interactor: interactor,
                                               presenter: presenter,
                                               wireframe: wireframe)
        viewInterfaceHandler(viewInterface)

        return .success(module)
    }
}
