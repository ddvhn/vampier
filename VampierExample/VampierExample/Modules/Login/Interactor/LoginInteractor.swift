//
//  
//  LoginInteractor.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

class LoginInteractor: BaseInteractor, ILoginInteractor {

    weak var eventHandler: ILoginInteractorOutput?

    required init(presenter: IPresenter) {

        guard let presenter = presenter as? ILoginPresenter else {
            fatalError("'presenter' must implement `ILoginPresenter` protocol")
        }

        self.eventHandler = presenter

        super.init(presenter: presenter)
    }
}
