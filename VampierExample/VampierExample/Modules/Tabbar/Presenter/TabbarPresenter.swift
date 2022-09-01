//
//  
//  TabbarPresenter.swift
//  VampierExample
//
//  Created by Den on 13.10.2020.
//
//

import Foundation
import Vampier

class TabbarPresenter: BasePresenter, ITabbarPresenter {

    weak var eventHandler: ITabbarInteractorInput?

    private weak var viewInterfaceInput: ITabbarViewInterfaceInput?
    private weak var _wireframe: ITabbarWireframe?

    required init(viewInterface: IViewInterface, wireframe: IWireframe) {

        guard let viewInterfaceInput = viewInterface as? ITabbarViewInterfaceInput else {
            fatalError("'viewInterface' must implement `ITabbarViewInterfaceInput` protocol")
        }

        guard let wireframe = wireframe as? ITabbarWireframe else {
            fatalError("'wireframe' must implement `ITabbarWireframe` protocol")
        }

        self.viewInterfaceInput = viewInterfaceInput
        self._wireframe = wireframe

        super.init(viewInterface: viewInterface, wireframe: wireframe)
    }

    // MARK: - IPresenter

    override func attach(interactor: IInteractor) {

        guard let interactorInput = interactor as? ITabbarInteractorInput  else {
            fatalError("'interactor' must implement `ITabbarInteractorInput` protocol")
        }

        self.eventHandler = interactorInput

        super.attach(interactor: interactor)
    }
}
