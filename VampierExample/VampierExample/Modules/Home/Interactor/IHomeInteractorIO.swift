//
//  
//  IHomeInteractorIO.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

protocol IHomeInteractorInput: AnyObject {
}

protocol IHomeInteractorOutput: AnyObject {
}

protocol IHomeInteractor: IInteractor, IHomeInteractorInput {

    var eventHandler: IHomeInteractorOutput? { get }
}
