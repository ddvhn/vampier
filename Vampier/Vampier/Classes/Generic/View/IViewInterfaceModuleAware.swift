//
//  IViewInterfaceModuleAware.swift
//  Vampier
//
//  Created by Den on 06.10.2020.
//

import Foundation

public protocol IViewInterfaceModuleAware {

    var module: IModule! { get }

    func attach(to module: IModule)
}
