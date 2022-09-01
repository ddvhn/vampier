//
//  
//  SplashInteractor.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

class SplashInteractor: BaseInteractor, ISplashInteractor {

    weak var eventHandler: ISplashInteractorOutput?

    required init(presenter: IPresenter) {

        guard let presenter = presenter as? ISplashPresenter else {
            fatalError("'presenter' must implement `ISplashPresenter` protocol")
        }

        self.eventHandler = presenter

        super.init(presenter: presenter)
    }
}
