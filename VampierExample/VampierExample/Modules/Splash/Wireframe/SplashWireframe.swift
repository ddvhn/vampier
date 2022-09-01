//
//  
//  SplashWireframe.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

class SplashWireframe: BaseWireframe, ISplashWireframe {

    var loginModuleAssembly: ILoginModuleAssembly?
    var homeModuleAssembly: IHomeModuleAssembly?
}


// MARK: - ISplashWireframe

extension SplashWireframe {

    func showLogin() {

        guard let loginModuleAssembly = self.loginModuleAssembly else {
            assertionFailure("'self.loginModuleAssembly' is nil")
            return
        }

        loginModuleAssembly.factory().createModule() { viewInterface in

            self.push(wireframe: viewInterface.module.wireframe, animated: true) {
                print("presented login module")
            }
        }
    }

    func showHome() {

        guard let homeModuleAssembly = self.homeModuleAssembly else {
            assertionFailure("'self.homeModuleAssembly' is nil")
            return
        }

        homeModuleAssembly.factory().createModule() { viewInterface in

            self.push(wireframe: viewInterface.module.wireframe, animated: true) {
                print("presented home module")
            }
        }
    }
}
