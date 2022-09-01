//
//  IInteractor.swift
//  Vampier
//
//  Created by Den on 06.10.2020.
//

import Foundation

public protocol IInteractor: IModuleAware {

    var presenter: IPresenter? { get }
}
