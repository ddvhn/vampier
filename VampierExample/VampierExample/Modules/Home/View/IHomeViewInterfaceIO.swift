//
//  
//  IHomeViewInterfaceIO.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

protocol IHomeViewInterfaceInput: AnyObject {
}

protocol IHomeViewInterfaceOutput: AnyObject {

    func onTap()
}

protocol IHomeViewInterface: IViewInterface, IHomeViewInterfaceInput {

    var eventHandler: IHomeViewInterfaceOutput? { get }
}
