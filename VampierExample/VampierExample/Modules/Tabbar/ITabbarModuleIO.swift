//
//  
//  ITabbarModuleIO.swift
//  VampierExample
//
//  Created by Den on 13.10.2020.
//
//

import Foundation

protocol ITabbarModuleAssemblyInput {

    var loginModuleAssembly: ILoginModuleAssembly? { get set }
    var homeModuleAssembly: IHomeModuleAssembly? { get set }
}

protocol ITabbarModuleInput: ITabbarModuleAssemblyInput {
}
