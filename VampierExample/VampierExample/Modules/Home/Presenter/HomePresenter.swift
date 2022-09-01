//
//  
//  HomePresenter.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

class HomePresenter: BasePresenter, IHomePresenter {

    weak var eventHandler: IHomeInteractorInput?

    private weak var viewInterfaceInput: IHomeViewInterfaceInput?
    private weak var _wireframe: IHomeWireframe?

    required init(viewInterface: IViewInterface, wireframe: IWireframe) {

        guard let viewInterfaceInput = viewInterface as? IHomeViewInterfaceInput else {
            fatalError("'viewInterface' must implement `IHomeViewInterfaceInput` protocol")
        }

        guard let wireframe = wireframe as? IHomeWireframe else {
            fatalError("'wireframe' must implement `IHomeWireframe` protocol")
        }

        self.viewInterfaceInput = viewInterfaceInput
        self._wireframe = wireframe

        super.init(viewInterface: viewInterface, wireframe: wireframe)
    }

    // MARK: - IPresenter

    override func attach(interactor: IInteractor) {

        guard let interactorInput = interactor as? IHomeInteractorInput  else {
            fatalError("'interactor' must implement `IHomeInteractorInput` protocol")
        }

        self.eventHandler = interactorInput

        super.attach(interactor: interactor)
    }
}


// MARK: - IHomeViewInterfaceOutput

extension HomePresenter {

    func onTap() {

//        self._wireframe?.showSettings()
        self._wireframe?.showTabbar()
    }
}
