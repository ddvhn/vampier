//
//  
//  LoginViewController.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import UIKit
import Vampier

class LoginViewController: BaseViewController, ILoginViewInterface  {

    weak var eventHandler: ILoginViewInterfaceOutput?

    override func viewDidLoad() {

        super.viewDidLoad()

        self.view.backgroundColor = .blue
        self.title = "Login"

        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap))
        self.view.addGestureRecognizer(tap)
    }

    @objc func onTap() {

        self.eventHandler?.onTap()
    }
}
