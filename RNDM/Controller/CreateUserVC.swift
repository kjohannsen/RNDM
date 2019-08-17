//
//  CreateUserVC.swift
//  RNDM
//
//  Created by Kyle Johannsen on 8/17/19.
//  Copyright © 2019 Kyle Johannsen. All rights reserved.
//

import UIKit

class CreateUserVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var createUserButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createUserButton.layer.cornerRadius = 10
        cancelButton.layer.cornerRadius = 10
    }
    
    @IBAction func createUserButtonPressed(_ sender: Any) {
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
    }
    
}
