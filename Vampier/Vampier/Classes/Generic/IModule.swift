//
//  IModule.swift
//  Vampier
//
//  Created by Den on 06.10.2020.
//

import Foundation

public protocol IModule: AnyObject {

    var viewInterface: IViewInterface? { get }
    var interactor: IInteractor { get }
    var presenter: IPresenter { get }
    var wireframe: IWireframe { get }
}
