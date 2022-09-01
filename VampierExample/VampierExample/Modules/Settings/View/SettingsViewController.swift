//
//  
//  SettingsViewController.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import UIKit
import Vampier

class SettingsViewController: BaseViewController, ISettingsViewInterface  {

    weak var eventHandler: ISettingsViewInterfaceOutput?

    override func viewDidLoad() {

        super.viewDidLoad()

        self.view.backgroundColor = .purple
        self.title = "Settings"
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap))
        self.view.addGestureRecognizer(tap)
    }

    @objc func onTap() {

        self.eventHandler?.onTap()
    }
}
