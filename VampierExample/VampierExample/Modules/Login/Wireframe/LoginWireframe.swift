//
//  
//  LoginWireframe.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

class LoginWireframe: BaseWireframe, ILoginWireframe {

    var homeModuleAsembly: IHomeModuleAssembly?
}


// MARK: - ILoginWireframe

extension LoginWireframe {

    func showHome() {

        guard let homeModuleAsembly = self.homeModuleAsembly else {
            assertionFailure("'self.homeModuleAsembly' is nil")
            return
        }

        homeModuleAsembly.factory().createModule() { viewInterface in

            self.push(wireframe: viewInterface.module.wireframe, animated: true) {
                print("presented home module")
            }
        }
    }
}
