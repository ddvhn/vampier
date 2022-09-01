//
//  
//  ISettingsPresenter.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

protocol ISettingsPresenter: IPresenter, ISettingsViewInterfaceOutput, ISettingsInteractorOutput {

    var eventHandler: ISettingsInteractorInput? { get }
}
