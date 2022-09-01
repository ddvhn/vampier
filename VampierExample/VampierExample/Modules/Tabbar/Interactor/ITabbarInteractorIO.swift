//
//  
//  ITabbarInteractorIO.swift
//  VampierExample
//
//  Created by Den on 13.10.2020.
//
//

import Foundation
import Vampier

protocol ITabbarInteractorInput: AnyObject {
}

protocol ITabbarInteractorOutput: AnyObject {
}

protocol ITabbarInteractor: IInteractor, ITabbarInteractorInput {

    var eventHandler: ITabbarInteractorOutput? { get }
}
