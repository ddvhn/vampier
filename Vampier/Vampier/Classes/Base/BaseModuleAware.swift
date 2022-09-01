//
//  BaseModuleAware.swift
//  Vampier
//
//  Created by Den on 06.10.2020.
//

import Foundation

open class BaseModuleAware: IModuleAware {

    private(set) weak public var module: IModule?
}


// MARK: - IModuleAware

extension BaseModuleAware {

    public func attach(to module: IModule) {

        assert(Thread.isMainThread)
        
        guard self.module == nil else { fatalError("'module' is attached already") }
        self.module = module
    }
}
