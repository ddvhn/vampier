//
//  ___FILEHEADER___
//

import Foundation
import Vampier

class ___VARIABLE_productName:identifier___Wireframe: BaseWireframe, I___VARIABLE_productName:identifier___Wireframe {

    required public init(viewInterface: I___VARIABLE_productName:identifier___ViewInterface, windowRootViewControllerUpdateUnit: IWindowRootViewControllerUpdateUnit) {

        assert(Thread.isMainThread)

        guard (viewInterface.viewController as? UINavigationController) == nil else {
            fatalError("'viewInterface.viewController' MUST NOT be an instance of 'UINavigationController'")
        }

        super.init(viewInterface: viewInterface, windowRootViewControllerUpdateUnit: windowRootViewControllerUpdateUnit)
    }

    public init (viewInterface: I___VARIABLE_productName:identifier___ViewInterface, containedWireframes: [IWireframe], windowRootViewControllerUpdateUnit: IWindowRootViewControllerUpdateUnit) {

        assert(Thread.isMainThread)

        guard (viewInterface.viewController as? UINavigationController) == nil else {
            fatalError("'viewInterface.viewController' MUST NOT be an instance of 'UINavigationController'")
        }

        super.init(viewInterface: viewInterface,
                   containedWireframes: containedWireframes,
                   windowRootViewControllerUpdateUnit: windowRootViewControllerUpdateUnit)
    }

    @available(*, unavailable)
    required init(viewInterface: IViewInterface, windowRootViewControllerUpdateUnit: IWindowRootViewControllerUpdateUnit) {

        fatalError("init(viewInterface:windowRootViewControllerUpdateUnit:) is unavailable")
    }
}


// MARK: - I___VARIABLE_productName:identifier___WireframeInput

extension ___VARIABLE_productName:identifier___Wireframe {
}
