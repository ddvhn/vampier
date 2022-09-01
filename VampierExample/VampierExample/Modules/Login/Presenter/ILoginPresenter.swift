//
//  
//  ILoginPresenter.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

protocol ILoginPresenter: IPresenter, ILoginViewInterfaceOutput, ILoginInteractorOutput {

    var eventHandler: ILoginInteractorInput? { get }
}
