//
//  INavigationAwareUnit.swift
//  Vampier
//
//  Created by Den on 09.10.2020.
//

import UIKit

enum INavigationAwareUnitTransactionContext {

    case push(_ expectedViewControllerToAppear: UIViewController?, _ completion: VoidClosure?)
    case pop(_ expectedViewControllerToAppear: UIViewController?, _ completion: VoidClosure?)
}

extension INavigationAwareUnitTransactionContext {

    var expectedViewControllerToAppear: UIViewController? {

        switch self {
        case .push(let expectedViewControllerToAppear, _):
            return expectedViewControllerToAppear
        case .pop(let expectedViewControllerToAppear, _):
            return expectedViewControllerToAppear
        }
    }

    var completion: VoidClosure? {

        switch self {
        case .push(_, let completion):
            return completion
        case .pop(_, let completion):
            return completion
        }
    }
}

protocol INavigationAwareUnit {

    var transactionContext: INavigationAwareUnitTransactionContext? { get }

    func push(viewController: UIViewController, to navigationController: UINavigationController, animated: Bool, completion: VoidClosure?)

    func pop(viewController: UIViewController, from navigationController: UINavigationController, animated: Bool, completion: VoidClosure?)
}
