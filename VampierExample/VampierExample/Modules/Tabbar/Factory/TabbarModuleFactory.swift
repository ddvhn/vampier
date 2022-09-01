//
//  
//  TabbarModuleFactory.swift
//  VampierExample
//
//  Created by Den on 13.10.2020.
//
//

import UIKit
import Vampier

class TabbarModuleFactory: BaseWindowRootViewControllerUpdateUnitAware, ITabbarModuleFactory {

    var loginModuleAssembly: ILoginModuleAssembly?
    var homeModuleAssembly: IHomeModuleAssembly?

    func createModule(viewInterfaceHandler: (IViewInterface) -> ()) -> Result<IModule, IModuleFactoryError> {

        var containedViewInterfaces: [IViewInterface] = []
        self.loginModuleAssembly!.factory().createModule() { containedViewInterfaces.append($0) }

        self.homeModuleAssembly!.factory().createModule() { containedViewInterfaces.append($0) }

        let containedWireframes: [IWireframe] = containedViewInterfaces.map { $0.module.wireframe }

        let viewInterface = TabbarViewController()
        viewInterface.viewControllers = containedViewInterfaces.map { UINavigationController(rootViewController: $0.viewController) }

        let wireframe: ITabbarWireframe = TabbarWireframe(viewInterface: viewInterface,
                                                          containedWireframes: containedWireframes,
                                                          windowRootViewControllerUpdateUnit: self.windowRootViewControllerUpdateUnit)
        let presenter: ITabbarPresenter = TabbarPresenter(viewInterface: viewInterface, wireframe: wireframe)
        let interactor: ITabbarInteractor = TabbarInteractor(presenter: presenter)

        viewInterface.eventHandler = presenter
        
        /// NOTE: inject assembly dependencies into `wireframe` below


        let module: ITabbarModule = TabbarModule(viewInterface: viewInterface,
                                               interactor: interactor,
                                               presenter: presenter,
                                               wireframe: wireframe)
        viewInterfaceHandler(viewInterface)

        return .success(module)
    }
}
