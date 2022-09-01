//
//  
//  SplashViewController.swift
//  VampierExample
//
//  Created by Den on 09.10.2020.
//
//

import UIKit
import PureLayout
import Vampier

class SplashViewController: BaseViewController, ISplashViewInterface  {

    weak var eventHandler: ISplashViewInterfaceOutput?

    override func viewDidLoad() {

        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.title = "Splash"

        let activityIndicator = UIActivityIndicatorView.init(style: .gray)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
        activityIndicator.autoCenterInSuperview()

        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap))
        self.view.addGestureRecognizer(tap)
    }

    @objc func onTap() {

        self.eventHandler?.onTap()
    }
}
