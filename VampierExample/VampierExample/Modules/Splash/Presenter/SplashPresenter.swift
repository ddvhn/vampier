//
//  
//  SplashPresenter.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

class SplashPresenter: BasePresenter, ISplashPresenter {

    weak var eventHandler: ISplashInteractorInput?

    private weak var viewInterfaceInput: ISplashViewInterfaceInput?
    private weak var _wireframe: ISplashWireframe?

    required init(viewInterface: IViewInterface, wireframe: IWireframe) {

        guard let viewInterfaceInput = viewInterface as? ISplashViewInterfaceInput else {
            fatalError("'viewInterface' must implement `ISplashViewInterfaceInput` protocol")
        }

        guard let wireframe = wireframe as? ISplashWireframe else {
            fatalError("'wireframe' must implement `ISplashWireframe` protocol")
        }

        self.viewInterfaceInput = viewInterfaceInput
        self._wireframe = wireframe

        super.init(viewInterface: viewInterface, wireframe: wireframe)
    }

    // MARK: - IPresenter

    override func attach(interactor: IInteractor) {

        guard let interactorInput = interactor as? ISplashInteractorInput  else {
            fatalError("'interactor' must implement `ISplashInteractorInput` protocol")
        }

        self.eventHandler = interactorInput

        super.attach(interactor: interactor)
    }
}


// MARK: - ISplashViewInterfaceOutput

extension SplashPresenter {

    func onTap() {

        self._wireframe?.showLogin()
    }
}
