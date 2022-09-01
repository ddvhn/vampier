//
//  
//  IHomeModuleIO.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation

protocol IHomeModuleAssemblyInput {

    var settingsModuleAssembly: ISettingsModuleAssembly? { get set }
    var loginModuleAssembly: ILoginModuleAssembly? { get set }
    var tabbarModuleAssembly: ITabbarModuleAssembly? { get set }
}

protocol IHomeModuleInput: IHomeModuleAssemblyInput {
}
