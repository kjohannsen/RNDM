//
//  LoginVC.swift
//  RNDM
//
//  Created by Kyle Johannsen on 8/17/19.
//  Copyright © 2019 Kyle Johannsen. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.layer.cornerRadius = 10
        signUpButton.layer.cornerRadius = 10
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
    }
    
}
