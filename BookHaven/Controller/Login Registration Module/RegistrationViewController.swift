//
//  RegistrationViewController.swift
//  BookHaven
//
//  Created by User on 01/09/24.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var confirmPasswordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        // set  the delegate method to user delegates method for textfield.
       passwordTextField.delegate = self
       usernameTextField.delegate = self
       emailTextfield.delegate = self
       confirmPasswordTextfield.delegate = self
        
        
        // call the  setpaddingview method to add left padding on textfield
        setpaddingViewOnTextField(passwordTextField)
        setpaddingViewOnTextField(usernameTextField)
        setpaddingViewOnTextField(emailTextfield)
        setpaddingViewOnTextField(confirmPasswordTextfield)
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
    
    
    
   
    
    
    
}

// mark delegate method for uitextfield

extension RegistrationViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        customizeTextField(textField)
        textField.text = ""
    }
}
