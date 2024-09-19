//
//  AccountViewController.swift
//  BookHaven
//
//  Created by User on 03/09/24.
//

import UIKit

class AccountViewController: UIViewController {
    
    
    // Outlets
    @IBOutlet weak var userProfilePic: UIView!
    
    @IBOutlet weak var EditButton: UIButton!
    
    @IBOutlet weak var LogoutButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    
    
    @IBOutlet weak var nameView: UIView!
    
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var emailView: UIView!
    
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var addressView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureView(nameView)
        configureView(emailView)
        configureView(passwordView)
        configureView(addressView)
         configureButton(EditButton)
         configureButton(LogoutButton)
        EditButton.tag = 1
        LogoutButton.tag = 2
        
    }
    
    
    
    func configureView( _ view: UIView){
        
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
    }
    
    func configureButton(_ button : UIButton) {
        
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.clipsToBounds = true
        button.setTitleColor(.black, for: .normal)
         
    }
    
    
    func  actionOnPressedButton(){
         
        EditButton.backgroundColor = UIColor.white
        EditButton.setTitleColor(.black, for: .normal)
        LogoutButton.backgroundColor = UIColor.white
        LogoutButton.setTitleColor(.black, for: .normal)
    }

    
    @IBAction func didTappedEditButton(_ sender: UIButton) {
        actionOnPressedButton()
        EditButton.backgroundColor = UIColor.black
        EditButton.setTitleColor(.white, for: .normal)
       
        
    }
    

    
    @IBAction func didTappedLogoutButton(_ sender: UIButton) {
        actionOnPressedButton()
        LogoutButton.backgroundColor = UIColor.black
        LogoutButton.setTitleColor(.white, for: .normal)
    }
    
    
}
