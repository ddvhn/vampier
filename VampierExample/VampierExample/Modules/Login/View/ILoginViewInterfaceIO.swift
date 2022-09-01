//
//  
//  ILoginViewInterfaceIO.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

protocol ILoginViewInterfaceInput: AnyObject {
}

protocol ILoginViewInterfaceOutput: AnyObject {

    func onTap()
}

protocol ILoginViewInterface: IViewInterface, ILoginViewInterfaceInput {

    var eventHandler: ILoginViewInterfaceOutput? { get }
}
