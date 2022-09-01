//
//  
//  SettingsModuleFactory.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

class SettingsModuleFactory: BaseWindowRootViewControllerUpdateUnitAware, ISettingsModuleFactory {

    func createModule(viewInterfaceHandler: (IViewInterface) -> ()) -> Result<IModule, IModuleFactoryError> {

        let viewInterface = SettingsViewController()
        let wireframe: ISettingsWireframe = SettingsWireframe(viewInterface: viewInterface, windowRootViewControllerUpdateUnit: self.windowRootViewControllerUpdateUnit)
        let presenter: ISettingsPresenter = SettingsPresenter(viewInterface: viewInterface, wireframe: wireframe)
        let interactor: ISettingsInteractor = SettingsInteractor(presenter: presenter)

        viewInterface.eventHandler = presenter
        
        /// NOTE: inject assembly dependencies into `wireframe` below

        let module: ISettingsModule = SettingsModule(viewInterface: viewInterface,
                                               interactor: interactor,
                                               presenter: presenter,
                                               wireframe: wireframe)
        viewInterfaceHandler(viewInterface)

        return .success(module)
    }
}
