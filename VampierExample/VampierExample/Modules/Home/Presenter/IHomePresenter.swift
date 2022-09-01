//
//  
//  IHomePresenter.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

protocol IHomePresenter: IPresenter, IHomeViewInterfaceOutput, IHomeInteractorOutput {

    var eventHandler: IHomeInteractorInput? { get }
}
