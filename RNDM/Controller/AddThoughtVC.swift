//
//  AddThoughtVC.swift
//  RNDM
//
//  Created by Kyle Johannsen on 8/14/19.
//  Copyright © 2019 Kyle Johannsen. All rights reserved.
//

import UIKit

class AddThoughtVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var categorySegment: UISegmentedControl!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var thoughtTextView: UITextView!
    @IBOutlet weak var postButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        thoughtTextView.layer.cornerRadius = 4
        postButton.layer.cornerRadius = 4
        thoughtTextView.text = "My random thought..."
        thoughtTextView.textColor = UIColor.lightGray
        thoughtTextView.delegate = self
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if thoughtTextView.text == "My random thought..." {
            thoughtTextView.text = ""
            thoughtTextView.textColor = UIColor.darkGray
        }
    }
    
    @IBAction func categorySegmentChanged(_ sender: Any) {
    }
    
    @IBAction func postButtonPressed(_ sender: Any) {
    }
    
    
}
