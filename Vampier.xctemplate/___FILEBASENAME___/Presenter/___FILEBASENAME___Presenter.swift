//
//  ___FILEHEADER___
//

import Foundation
import Vampier

final class ___VARIABLE_productName:identifier___Presenter: BasePresenter, I___VARIABLE_productName:identifier___Presenter {

    private(set) weak var interactorInput: I___VARIABLE_productName:identifier___InteractorInput?
    private(set) weak var viewInterfaceInput: I___VARIABLE_productName:identifier___ViewInterfaceInput?
    private(set) weak var wireframeInput: I___VARIABLE_productName:identifier___WireframeInput?

    required init(viewInterface: I___VARIABLE_productName:identifier___ViewInterface, wireframe: I___VARIABLE_productName:identifier___Wireframe) {

        self.viewInterfaceInput = viewInterface
        self.wireframeInput = wireframe

        super.init(viewInterface: viewInterface, wireframe: wireframe)
    }

    @available(*, unavailable)
    required init(viewInterface: IViewInterface, wireframe: IWireframe) {

        fatalError("init(viewInterface:wireframe:) is unavailable")
    }

    override func attach(interactor: IInteractor) {

        guard let interactorInput = interactor as? I___VARIABLE_productName:identifier___InteractorInput else {
            fatalError("'interactor' MUST implement `I___VARIABLE_productName:identifier___InteractorInput` protocol")
        }

        self.interactorInput = interactorInput
        super.attach(interactor: interactor)
    }
}


// MARK: - I___VARIABLE_productName:identifier___InteractorOutput

extension ___VARIABLE_productName:identifier___Presenter {
}


// MARK: - I___VARIABLE_productName:identifier___ViewInterfaceOutput

extension ___VARIABLE_productName:identifier___Presenter {

    func viewInterfaceDidLoad(_ viewInterface: I___VARIABLE_productName:identifier___ViewInterfaceInput) {
    }

    func viewInterfaceWillAppear(_ viewInterface: I___VARIABLE_productName:identifier___ViewInterfaceInput, animated: Bool) {
    }
}
