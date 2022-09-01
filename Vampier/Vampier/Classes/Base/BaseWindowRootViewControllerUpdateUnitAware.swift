//
//  BaseWindowRootViewControllerUpdateUnitAware.swift
//  Vampier
//
//  Created by Den on 09.10.2020.
//

import Foundation

open class BaseWindowRootViewControllerUpdateUnitAware: IWindowRootViewControllerUpdateUnitAware {
    
    public let windowRootViewControllerUpdateUnit: IWindowRootViewControllerUpdateUnit
    
    required public init (windowRootViewControllerUpdateUnit: IWindowRootViewControllerUpdateUnit) {
        
        assert(Thread.isMainThread)
        
        self.windowRootViewControllerUpdateUnit = windowRootViewControllerUpdateUnit
    }
}
