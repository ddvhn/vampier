//
//  ___FILEHEADER___
//

import Foundation
import Vampier

class ___VARIABLE_productName:identifier___ModuleFactory: BaseWindowRootViewControllerUpdateUnitAware, I___VARIABLE_productName:identifier___ModuleFactory {

    let anyProperty: AnyObject

    init(windowRootViewControllerUpdateUnit: IWindowRootViewControllerUpdateUnit, anyProperty: AnyObject) {

        self.anyProperty = anyProperty

        super.init(windowRootViewControllerUpdateUnit: windowRootViewControllerUpdateUnit)
    }

    @available(*, unavailable)
    required init(windowRootViewControllerUpdateUnit: IWindowRootViewControllerUpdateUnit) {

        fatalError("init(windowRootViewControllerUpdateUnit:) is not supported")
    }

    
    // MARK: IModuleFactory

    func createModule(viewInterfaceHandler: (IViewInterface) -> ()) -> Vampier.Result<IModule, IModuleFactoryError> {

        let viewInterface = ___VARIABLE_productName:identifier___ViewController()
        let wireframe: I___VARIABLE_productName:identifier___Wireframe = ___VARIABLE_productName:identifier___Wireframe(viewInterface: viewInterface, windowRootViewControllerUpdateUnit: self.windowRootViewControllerUpdateUnit)
        let presenter: I___VARIABLE_productName:identifier___Presenter = ___VARIABLE_productName:identifier___Presenter(viewInterface: viewInterface, wireframe: wireframe)
        let interactor: I___VARIABLE_productName:identifier___Interactor = ___VARIABLE_productName:identifier___Interactor(presenter: presenter)

        viewInterface.eventHandler = presenter

        /// (!) IMPORTANT: do not forget to inject assembly dependencies into `wireframe` below


        let module: I___VARIABLE_productName:identifier___Module = ___VARIABLE_productName:identifier___Module(viewInterface: viewInterface,
                                               interactor: interactor,
                                               presenter: presenter,
                                               wireframe: wireframe)
        viewInterfaceHandler(viewInterface)

        return .success(module)
    }
}
