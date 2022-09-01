//
//  
//  HomeViewController.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import UIKit
import Vampier

class HomeViewController: BaseViewController, IHomeViewInterface  {

    weak var eventHandler: IHomeViewInterfaceOutput?

    override func viewDidLoad() {

        super.viewDidLoad()

        self.view.backgroundColor = .orange
        self.title = "Home"

        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap))
        self.view.addGestureRecognizer(tap)
    }

    @objc func onTap() {

        self.eventHandler?.onTap()
    }
}
