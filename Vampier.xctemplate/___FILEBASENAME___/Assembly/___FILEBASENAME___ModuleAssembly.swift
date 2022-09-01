//
//  ___FILEHEADER___
//

import Foundation
import Vampier

class ___VARIABLE_productName:identifier___ModuleAssembly: BaseModuleAssembly, I___VARIABLE_productName:identifier___ModuleAssembly {

    let anyProperty: AnyObject

    init(windowRootViewControllerUpdateUnit: IWindowRootViewControllerUpdateUnit, anyProperty: AnyObject) {

        self.anyProperty = anyProperty

        super.init(windowRootViewControllerUpdateUnit: windowRootViewControllerUpdateUnit)
    }

    @available(*, unavailable)
    required init(windowRootViewControllerUpdateUnit: IWindowRootViewControllerUpdateUnit) {

        fatalError("init(windowRootViewControllerUpdateUnit:) is not supported")
    }


    // MARK: IModuleAssembly

    override func factory() -> IModuleFactory {

        let factory: I___VARIABLE_productName:identifier___ModuleFactory = ___VARIABLE_productName:identifier___ModuleFactory(
            windowRootViewControllerUpdateUnit: self.windowRootViewControllerUpdateUnit,
            anyProperty: self.anyProperty
        )
        
        /// (!) IMPORTANT: do not forget to inject assembly and data dependencies into `factory` below
        

        return factory
    }
}
