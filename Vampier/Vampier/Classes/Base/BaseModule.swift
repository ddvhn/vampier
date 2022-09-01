//
//  BaseModule.swift
//  Vampier
//
//  Created by Den on 06.10.2020.
//

import Foundation

open class BaseModule: IModule {

    private(set) weak public var viewInterface: IViewInterface?
    private(set) public var interactor: IInteractor
    private(set) public var presenter: IPresenter
    private(set) public var wireframe: IWireframe

    required public init(viewInterface: IViewInterface,
                  interactor: IInteractor,
                  presenter: IPresenter,
                  wireframe: IWireframe) {

        assert(Thread.isMainThread)

        self.viewInterface = viewInterface
        self.interactor = interactor
        self.presenter = presenter
        self.wireframe = wireframe

        viewInterface.attach(to: self)
        interactor.attach(to: self)
        presenter.attach(to: self)
        wireframe.attach(to: self)
    }
}
