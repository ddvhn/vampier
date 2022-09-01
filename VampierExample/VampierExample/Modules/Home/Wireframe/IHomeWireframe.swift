//
//  
//  IHomeWireframe.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

protocol IHomeWireframe: IWireframe, IHomeModuleAssemblyInput {

    func showSettings()
    func showLogin()
    func showTabbar()
}
