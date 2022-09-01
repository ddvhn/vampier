//
//  
//  ISettingsInteractorIO.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

protocol ISettingsInteractorInput: AnyObject {
}

protocol ISettingsInteractorOutput: AnyObject {
}

protocol ISettingsInteractor: IInteractor, ISettingsInteractorInput {

    var eventHandler: ISettingsInteractorOutput? { get }
}
