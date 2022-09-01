//
//  
//  ISettingsViewInterfaceIO.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

protocol ISettingsViewInterfaceInput: AnyObject {
}

protocol ISettingsViewInterfaceOutput: AnyObject {

    func onTap()
}

protocol ISettingsViewInterface: IViewInterface, ISettingsViewInterfaceInput {

    var eventHandler: ISettingsViewInterfaceOutput? { get }
}
