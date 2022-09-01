//
//  ___FILEHEADER___
//

import Foundation
import Vampier

final class ___VARIABLE_productName:identifier___Interactor: BaseInteractor, I___VARIABLE_productName:identifier___Interactor {

    private(set) weak var eventHandler: I___VARIABLE_productName:identifier___InteractorOutput?

    required init(presenter: I___VARIABLE_productName:identifier___Presenter) {

        self.eventHandler = presenter

        super.init(presenter: presenter)
    }

    @available(*, unavailable)
    required init(presenter: IPresenter) {

        fatalError("init(presenter:) is unavailable")
    }
}


// MARK: - I___VARIABLE_productName:identifier___InteractorInput

extension ___VARIABLE_productName:identifier___Interactor {
}
