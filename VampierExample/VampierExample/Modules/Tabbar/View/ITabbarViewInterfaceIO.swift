//
//  
//  ITabbarViewInterfaceIO.swift
//  VampierExample
//
//  Created by Den on 13.10.2020.
//
//

import Foundation
import Vampier

protocol ITabbarViewInterfaceInput: AnyObject {
}

protocol ITabbarViewInterfaceOutput: AnyObject {
}

protocol ITabbarViewInterface: IViewInterface, ITabbarViewInterfaceInput {

    var eventHandler: ITabbarViewInterfaceOutput? { get }
}
