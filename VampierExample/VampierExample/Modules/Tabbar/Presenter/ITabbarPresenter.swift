//
//  
//  ITabbarPresenter.swift
//  VampierExample
//
//  Created by Den on 13.10.2020.
//
//

import Foundation
import Vampier

protocol ITabbarPresenter: IPresenter, ITabbarViewInterfaceOutput, ITabbarInteractorOutput {

    var eventHandler: ITabbarInteractorInput? { get }
}
