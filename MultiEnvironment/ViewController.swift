//
//  ViewController.swift
//  MultiEnvironment
//
//  Created by Kwame Agyenim Boateng on 8/12/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("DEBUG: Environment: \(BuildConfiguration.shared.environment)")
        print("DEBUG: API URL: \(BuildConfiguration.shared.baseURL)")
    }
}

