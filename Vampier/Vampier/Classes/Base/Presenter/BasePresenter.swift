//
//  BasePresenter.swift
//  Vampier
//
//  Created by Den on 06.10.2020.
//

import Foundation

open class BasePresenter: BaseModuleAware, IPresenter {

    private(set) weak public var viewInterface: IViewInterface?
    private(set) weak public var interactor: IInteractor?
    private(set) weak public var wireframe: IWireframe?
    
    required public init (viewInterface: IViewInterface, wireframe: IWireframe) {

        assert(Thread.isMainThread)

        self.viewInterface = viewInterface
        self.wireframe = wireframe
    }

    
    // MARK: - IPresenter

    open func attach(interactor: IInteractor) {

        assert(Thread.isMainThread)
        
        guard self.module == nil else { fatalError("'module' is attached already") }
        self.interactor = interactor
    }
}
