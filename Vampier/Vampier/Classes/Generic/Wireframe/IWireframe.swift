//
//  IWireframe.swift
//  Vampier
//
//  Created by Den on 06.10.2020.
//

import Foundation

public enum IWireframePresentationType {

    case none
    case modal
    case navigation
    case root
    case contained
}

public enum IWireframeRootPresentationTransitionAnimation {

    case none
    case transitionCrossDissolve
    case transitionFlipFromLeft
    case transitionFlipFromRight
}

public protocol IWireframeHierarchyDelegate: AnyObject {

    func wireframe(_ wireframe: IWireframe, hierarchyWillAttachChildWireframe child: IWireframe, withPresentation type: IWireframePresentationType)

    func wireframe(_ wireframe: IWireframe, hierarchyWillDetachChildWireframe child: IWireframe)
}

public protocol IWireframe: IModuleAware, IWindowRootViewControllerUpdateUnitAware {

    var viewInterface: IViewInterface? { get }
    var presentationType: IWireframePresentationType { get }

    var nextWireframe: IWireframe? { get }
    var parentWireframe: IWireframe? { get }

    var containedWireframes: [IWireframe] { get }

    func setHierarchyDelegate(_ delegate: IWireframeHierarchyDelegate?)

    func push(wireframe: IWireframe, animated: Bool, completion: VoidClosure?)
    func present(wireframe: IWireframe, animated: Bool, completion: VoidClosure?)
    func present(wireframe: IWireframe, animated: Bool, inNavigationContainer: Bool, completion: VoidClosure?)
    func presentAsRoot(animation: IWireframeRootPresentationTransitionAnimation, completion: VoidClosure?)

    func dismiss(animated: Bool, completion: VoidClosure?)
}
