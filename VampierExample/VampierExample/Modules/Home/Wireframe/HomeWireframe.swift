//
//  
//  HomeWireframe.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import Foundation
import Vampier

class HomeWireframe: BaseWireframe, IHomeWireframe {

    var settingsModuleAssembly: ISettingsModuleAssembly?
    var loginModuleAssembly: ILoginModuleAssembly?
    var tabbarModuleAssembly: ITabbarModuleAssembly?
}


// MARK: - IHomeWireframe

extension HomeWireframe {

    func showSettings() {

        guard let settingsModuleAssembly = self.settingsModuleAssembly else {
            assertionFailure("'self.homeModuleAsembly' is nil")
            return
        }

        settingsModuleAssembly.factory().createModule() { viewInterface in

            self.present(wireframe: viewInterface.module.wireframe, animated: true) {

                print("presented settings module")
            }
        }
    }

    func showLogin() {

        guard let loginModuleAssembly = self.loginModuleAssembly else {
            assertionFailure("'self.loginModuleAssembly' is nil")
            return
        }

        loginModuleAssembly.factory().createModule() { viewInterface in

            viewInterface.module.wireframe.presentAsRoot(animation: .transitionCrossDissolve) {

                print("presented login module as root")
            }
        }
    }

    func showTabbar() {

        guard let tabbarModuleAssembly = self.tabbarModuleAssembly else {
            assertionFailure("'self.loginModuleAssembly' is nil")
            return
        }

        tabbarModuleAssembly.factory().createModule() { viewInterface in

            self.push(wireframe: viewInterface.module.wireframe, animated: true) {

                print("pushed tab bar")
            }
        }
    }
}
