//
//  LoginViewController.swift
//  BookHaven
//
//  Created by User on 01/09/24.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextfield:UITextField!
    @IBOutlet weak var passwordtextField:UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // call the set padding view to add padding on left side of  the textfield
        setpaddingViewOnTextField(usernameTextfield)
        setpaddingViewOnTextField(passwordtextField)
        usernameTextfield.delegate = self
        passwordtextField.delegate = self 
    }
    
    func setpaddingViewOnTextField(_ textField:UITextField) {
        // Add left padding
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    }
    func customizeTextField(_ textField: UITextField) {
            // Set the border width and color
            textField.layer.borderWidth = 2.0
            textField.layer.borderColor = UIColor.black.cgColor
            
        }
    @IBAction func backArrowButtonPressed(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func getStartedButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func newMemeberRegistrationButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func forgotPasswordButtonPressed(_ sender: UIButton) {
        
    }
  
}


// mark uitextfield delegate methods.
extension LoginViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        customizeTextField(textField)
        textField.text = ""
    }
}
