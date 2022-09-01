//
//  IModuleAware.swift
//  Vampier
//
//  Created by Den on 06.10.2020.
//

import Foundation

public protocol IModuleAware: AnyObject {

    var module: IModule? { get }

    func attach(to module: IModule)
}
