//
//  
//  TabbarInteractor.swift
//  VampierExample
//
//  Created by Den on 13.10.2020.
//
//

import Foundation
import Vampier

class TabbarInteractor: BaseInteractor, ITabbarInteractor {

    weak var eventHandler: ITabbarInteractorOutput?

    required init(presenter: IPresenter) {

        guard let presenter = presenter as? ITabbarPresenter else {
            fatalError("'presenter' must implement `ITabbarPresenter` protocol")
        }

        self.eventHandler = presenter

        super.init(presenter: presenter)
    }
}
