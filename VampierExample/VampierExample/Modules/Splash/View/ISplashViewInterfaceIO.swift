//
//  
//  ISplashViewInterfaceIO.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

protocol ISplashViewInterfaceInput: AnyObject {
}

protocol ISplashViewInterfaceOutput: AnyObject {

    func onTap()
}

protocol ISplashViewInterface: IViewInterface, ISplashViewInterfaceInput {

    var eventHandler: ISplashViewInterfaceOutput? { get }
}
