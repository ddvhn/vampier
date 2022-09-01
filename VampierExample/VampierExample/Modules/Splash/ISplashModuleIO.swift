//
//  
//  ISplashModuleIO.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation

protocol ISplashModuleAssemblyInput {

    var loginModuleAssembly: ILoginModuleAssembly? { get set }
    var homeModuleAssembly: IHomeModuleAssembly? { get set }
}

protocol ISplashModuleInput: ISplashModuleAssemblyInput {
}
