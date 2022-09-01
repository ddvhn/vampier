//
//  
//  ISplashInteractorIO.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

protocol ISplashInteractorInput: AnyObject {
}

protocol ISplashInteractorOutput: AnyObject {
}

protocol ISplashInteractor: IInteractor, ISplashInteractorInput {

    var eventHandler: ISplashInteractorOutput? { get }
}
