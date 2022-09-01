//
//  
//  ILoginInteractorIO.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

protocol ILoginInteractorInput: AnyObject {
}

protocol ILoginInteractorOutput: AnyObject {
}

protocol ILoginInteractor: IInteractor, ILoginInteractorInput {

    var eventHandler: ILoginInteractorOutput? { get }
}
