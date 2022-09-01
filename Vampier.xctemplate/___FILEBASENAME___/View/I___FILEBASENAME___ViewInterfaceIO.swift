//
//  ___FILEHEADER___
//

import Foundation
import Vampier

protocol I___VARIABLE_productName:identifier___ViewInterfaceInput: AnyObject {
}

protocol I___VARIABLE_productName:identifier___ViewInterfaceOutput: AnyObject {

    func viewInterfaceDidLoad(_ viewInterface: I___VARIABLE_productName:identifier___ViewInterfaceInput)
    func viewInterfaceWillAppear(_ viewInterface: I___VARIABLE_productName:identifier___ViewInterfaceInput, animated: Bool)
}

protocol I___VARIABLE_productName:identifier___ViewInterface: IViewInterface, I___VARIABLE_productName:identifier___ViewInterfaceInput {

    var eventHandler: I___VARIABLE_productName:identifier___ViewInterfaceOutput? { get }
}
