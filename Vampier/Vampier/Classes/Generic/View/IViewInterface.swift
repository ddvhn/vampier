//
//  IViewInterface.swift
//  Vampier
//
//  Created by Den on 06.10.2020.
//

import UIKit

public protocol IViewInterface: AnyObject, IViewInterfaceModuleAware {

    var viewController: UIViewController { get }
}
