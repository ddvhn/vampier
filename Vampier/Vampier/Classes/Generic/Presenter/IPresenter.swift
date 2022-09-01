//
//  IPresenter.swift
//  Vampier
//
//  Created by Den on 06.10.2020.
//

import Foundation

public protocol IPresenter: IModuleAware {

    var viewInterface: IViewInterface? { get }
    var interactor: IInteractor? { get }
    var wireframe: IWireframe? { get }

    func attach(interactor: IInteractor)
}
