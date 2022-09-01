//
//  
//  ILoginModuleIO.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation

protocol ILoginModuleAssemblyInput {

    var homeModuleAsembly: IHomeModuleAssembly? { get set }
}

protocol ILoginModuleInput: ILoginModuleAssemblyInput {
}
