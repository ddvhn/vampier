//
//  ___FILEHEADER___
//

import Foundation
import Vampier

final class ___VARIABLE_productName:identifier___Module: BaseModule, I___VARIABLE_productName:identifier___Module {

    required public init(viewInterface: I___VARIABLE_productName:identifier___ViewInterface,
                         interactor: I___VARIABLE_productName:identifier___Interactor,
                         presenter: I___VARIABLE_productName:identifier___Presenter,
                         wireframe: I___VARIABLE_productName:identifier___Wireframe) {

        assert(Thread.isMainThread)

        super.init(viewInterface: viewInterface, interactor: interactor, presenter: presenter, wireframe: wireframe)
    }

    @available(*, unavailable)
    required init(viewInterface: IViewInterface, interactor: IInteractor, presenter: IPresenter, wireframe: IWireframe) {

        fatalError("init(viewInterface:interactor:presenter:wireframe:) is unavailable")
    }
}
