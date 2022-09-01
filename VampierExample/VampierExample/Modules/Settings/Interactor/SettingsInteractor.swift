//
//  
//  SettingsInteractor.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

class SettingsInteractor: BaseInteractor, ISettingsInteractor {

    weak var eventHandler: ISettingsInteractorOutput?

    required init(presenter: IPresenter) {

        guard let presenter = presenter as? ISettingsPresenter else {
            fatalError("'presenter' must implement `ISettingsPresenter` protocol")
        }

        self.eventHandler = presenter

        super.init(presenter: presenter)
    }
}
