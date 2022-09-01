//
//  ___FILEHEADER___
//

import Foundation
import Vampier

protocol I___VARIABLE_productName:identifier___InteractorInput: AnyObject {
}

protocol I___VARIABLE_productName:identifier___InteractorOutput: AnyObject {
}

protocol I___VARIABLE_productName:identifier___Interactor: IInteractor, I___VARIABLE_productName:identifier___InteractorInput {

    var eventHandler: I___VARIABLE_productName:identifier___InteractorOutput? { get }
}
