//
//  IWindowRootViewControllerUpdateUnit.swift
//  Vampier
//
//  Created by Den on 10.10.2020.
//

import UIKit

public protocol IWindowRootViewControllerUpdateUnit: IWindowAware {

    var windowFactory: IWindowFactory { get }

    func setRoot(viewController: UIViewController, animation: IWireframeRootPresentationTransitionAnimation, completion: VoidClosure?)
}
