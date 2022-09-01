//
//  
//  ISplashPresenter.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

protocol ISplashPresenter: IPresenter, ISplashViewInterfaceOutput, ISplashInteractorOutput {

    var eventHandler: ISplashInteractorInput? { get }
}
