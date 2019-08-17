//
//  CreateUserVC.swift
//  RNDM
//
//  Created by Kyle Johannsen on 8/17/19.
//  Copyright © 2019 Kyle Johannsen. All rights reserved.
//

import UIKit
import Firebase

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
        
        guard let email = emailTextField!.text,
            let password = passwordTextField!.text,
            let username = usernameTextField!.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                debugPrint("Error creating user \(error.localizedDescription)")
            }
            
            let changeRequest = result?.user.createProfileChangeRequest()
            changeRequest?.displayName = username
            changeRequest?.commitChanges(completion: { (error) in
                if let error = error {
                    debugPrint(error.localizedDescription)
                }
            })
            
            guard let userId = result?.user.uid else { return }
            Firestore.firestore().collection(USERS_REF).document(userId).setData([
                USERNAME : username,
                DATE_CREATED : FieldValue.serverTimestamp()
                ], completion: { (error) in
                if let error = error {
                    debugPrint(error.localizedDescription)
                } else {
                    self.dismiss(animated: true, completion: nil)
                    }
            })
        }
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
