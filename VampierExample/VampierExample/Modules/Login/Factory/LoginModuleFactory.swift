//
//  
//  LoginModuleFactory.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

class LoginModuleFactory: BaseWindowRootViewControllerUpdateUnitAware, ILoginModuleFactory {

    var homeModuleAsembly: IHomeModuleAssembly?

    func createModule(viewInterfaceHandler: (IViewInterface) -> ()) -> Result<IModule, IModuleFactoryError> {

        let viewInterface = LoginViewController()
        var wireframe: ILoginWireframe = LoginWireframe(viewInterface: viewInterface,
                                                        windowRootViewControllerUpdateUnit: self.windowRootViewControllerUpdateUnit)
        let presenter: ILoginPresenter = LoginPresenter(viewInterface: viewInterface,
                                                        wireframe: wireframe)
        let interactor: ILoginInteractor = LoginInteractor(presenter: presenter)

        viewInterface.eventHandler = presenter
        
        /// NOTE: inject assembly dependencies into `wireframe` below
        assert(self.homeModuleAsembly != nil)
        wireframe.homeModuleAsembly = self.homeModuleAsembly

        let module: ILoginModule = LoginModule(viewInterface: viewInterface,
                                               interactor: interactor,
                                               presenter: presenter,
                                               wireframe: wireframe)
        viewInterfaceHandler(viewInterface)

        return .success(module)
    }
}
