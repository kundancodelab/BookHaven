//
//  DetailBookViewController.swift
//  BookHaven
//
//  Created by User on 14/09/24.
//

import UIKit
protocol tabbarDelegate : AnyObject{
    func  selectCart()
}

class DetailBookViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    // Outlets
    
    @IBOutlet weak var bookCoverImage: UIImageView!
    
    @IBOutlet weak var bookTitleLabel: UILabel!
    
    @IBOutlet weak var shoppingBagimagetap: UIImageView!
    
    
    @IBOutlet weak var authorNameLabel: UILabel!
    
    @IBOutlet weak var bookCategoryLabel: UILabel!
    
    @IBOutlet weak var RatingLabel: UILabel!
    
    
    @IBOutlet weak var pricingLabel: UILabel!
    
    @IBOutlet weak var bookNameLabel: UILabel!
    
   weak  var delegate: tabbarDelegate?
    
    var bookTitleCategory:String?
    var bookPrice:String?
    var bookDescription:String?
    var bookAuthor:String?
    var bookCatagory:String?
    var bookImage:UIImage?
    var currentViewController: UIViewController?
    var bookTitle:String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUI()
        
        configureImageview(bookCoverImage)
    }
    
    
    // Here we are updating the ui.
    func updateUI(){
        
        bookCoverImage.image = bookImage
        bookNameLabel.text = bookTitle
        authorNameLabel.text = bookAuthor
        pricingLabel.text = bookPrice
       
    }

    // this configureImageView is used for  configure the imageView
    func configureImageview(_ imageview: UIImageView) {
        imageview.layer.cornerRadius = 6
        imageview.clipsToBounds = true
    }
   
    
    
    
    // this action is used for going back to previous viewcontroller.
    @IBAction func didArrayButtonPressed(_ sender: UIButton) {
        
        // Check if the current view controller has a parent view controller
        if let currentVC = self.parent {
               self.view.removeFromSuperview() // Remove current view
               self.removeFromParent() // Remove current VC from parent

               // Re-add the previous view controller's view back
               currentVC.view.frame = view.bounds
               self.view.superview?.addSubview(currentVC.view)  // Add it back to the view hierarchy
               currentViewController = nil
           }
    
        
    }
    private func navigateToViewController(withIdentifier identifier: String) {
        // Remove the current view controller if there is one
        if let currentVC = currentViewController {
            print(" we are deleting the present viewcontroller from the navigation view hirachy  and then we are going back on the viewcontroller. ")
            currentVC.view.removeFromSuperview()
            currentVC.removeFromParent()
        }

        // Instantiate the new view controller
        guard let vc = storyboard?.instantiateViewController(withIdentifier: identifier) else {
            return
        }
        
        if let purchasevc = vc as?  PurchseCartViewController{
               print(" we are assigning here 1 to the btn tag . ")
               purchasevc.btnTag = 1 // Assign delegate if HomeViewController
           }
        
        
        // Add the new view controller
        addChild(vc)
        vc.view.frame = contentView.bounds // Match the size of contentView
        contentView.addSubview(vc.view)
        vc.didMove(toParent: self)

        // Update the current view controller reference
        currentViewController = vc

    }

    
    
    @IBAction func didTapaddToCartButton(_ sender: UIButton) {
        print(" first stage...")
       
        navigateToViewController(withIdentifier: "PurchseCartViewController")
        self.delegate?.selectCart()
          
    }
    
}
