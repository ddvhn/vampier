//
//  IApplicatonBuilder.swift
//  Vampier
//
//  Created by Den on 15.10.2020.
//

import UIKit

public protocol IApplicatonBuilder {

    // iOS 11+ support
    func build()
    func build(with completion: VoidClosure?)

    @available(iOS 13.0, *)
    func build(using windowScene: UIWindowScene)
    @available(iOS 13.0, *)
    func build(using windowScene: UIWindowScene, completion: VoidClosure?)

    func build(using windowFactory: IWindowFactory)
    func build(using windowFactory: IWindowFactory, completion: VoidClosure?)
}
