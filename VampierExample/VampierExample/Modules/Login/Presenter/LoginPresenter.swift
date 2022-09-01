//
//  
//  LoginPresenter.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

class LoginPresenter: BasePresenter, ILoginPresenter {

    weak var eventHandler: ILoginInteractorInput?

    private weak var viewInterfaceInput: ILoginViewInterfaceInput?
    private weak var _wireframe: ILoginWireframe?

    required init(viewInterface: IViewInterface, wireframe: IWireframe) {

        guard let viewInterfaceInput = viewInterface as? ILoginViewInterfaceInput else {
            fatalError("'viewInterface' must implement `ILoginViewInterfaceInput` protocol")
        }

        guard let wireframe = wireframe as? ILoginWireframe else {
            fatalError("'wireframe' must implement `ILoginWireframe` protocol")
        }

        self.viewInterfaceInput = viewInterfaceInput
        self._wireframe = wireframe

        super.init(viewInterface: viewInterface, wireframe: wireframe)
    }

    // MARK: - IPresenter

    override func attach(interactor: IInteractor) {

        guard let interactorInput = interactor as? ILoginInteractorInput  else {
            fatalError("'interactor' must implement `ILoginInteractorInput` protocol")
        }

        self.eventHandler = interactorInput

        super.attach(interactor: interactor)
    }
}


// MARK: - ILoginViewInterfaceOutput

extension LoginPresenter {

    func onTap() {

        self._wireframe?.showHome()
    }
}
