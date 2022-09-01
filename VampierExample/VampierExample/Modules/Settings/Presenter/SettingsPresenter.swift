//
//  
//  SettingsPresenter.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

class SettingsPresenter: BasePresenter, ISettingsPresenter {

    weak var eventHandler: ISettingsInteractorInput?

    private weak var viewInterfaceInput: ISettingsViewInterfaceInput?
    private weak var _wireframe: ISettingsWireframe?

    required init(viewInterface: IViewInterface, wireframe: IWireframe) {

        guard let viewInterfaceInput = viewInterface as? ISettingsViewInterfaceInput else {
            fatalError("'viewInterface' must implement `ISettingsViewInterfaceInput` protocol")
        }

        guard let wireframe = wireframe as? ISettingsWireframe else {
            fatalError("'wireframe' must implement `ISettingsWireframe` protocol")
        }

        self.viewInterfaceInput = viewInterfaceInput
        self._wireframe = wireframe

        super.init(viewInterface: viewInterface, wireframe: wireframe)
    }

    // MARK: - IPresenter

    override func attach(interactor: IInteractor) {

        guard let interactorInput = interactor as? ISettingsInteractorInput  else {
            fatalError("'interactor' must implement `ISettingsInteractorInput` protocol")
        }

        self.eventHandler = interactorInput

        super.attach(interactor: interactor)
    }
}


// MARK: - ISettingsViewInterfaceOutput

extension SettingsPresenter  {

    func onTap() {

        self.wireframe?.dismiss(animated: true, completion: nil)
    }
}
