//
//  ___FILEHEADER___
//

import UIKit
import Vampier

final class ___VARIABLE_productName:identifier___ViewController: BaseViewController, I___VARIABLE_productName:identifier___ViewInterface  {

    weak var eventHandler: I___VARIABLE_productName:identifier___ViewInterfaceOutput?


    // MARK: View lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()

        if let eventHandler = self.eventHandler {
            eventHandler.viewInterfaceDidLoad(self)
        } else {
            assertionFailure("'self.eventHandler' is nil")
        }
    }

    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)

        if let eventHandler = self.eventHandler {
            eventHandler.viewInterfaceWillAppear(self, animated: animated)
        } else {
            assertionFailure("'self.eventHandler' is nil")
        }
    }
}
