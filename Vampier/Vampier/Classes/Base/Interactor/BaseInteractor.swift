//
//  BaseInteractor.swift
//  Vampier
//
//  Created by Den on 06.10.2020.
//

import Foundation

open class BaseInteractor: BaseModuleAware, IInteractor {

    private(set) weak public var presenter: IPresenter?
    
    required public init(presenter: IPresenter) {

        assert(Thread.isMainThread)

        self.presenter = presenter

        super.init()
        presenter.attach(interactor: self)
    }
}
