//
//  
//  HomeInteractor.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

class HomeInteractor: BaseInteractor, IHomeInteractor {

    weak var eventHandler: IHomeInteractorOutput?

    required init(presenter: IPresenter) {

        guard let presenter = presenter as? IHomePresenter else {
            fatalError("'presenter' must implement `IHomePresenter` protocol")
        }

        self.eventHandler = presenter

        super.init(presenter: presenter)
    }
}
