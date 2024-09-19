import UIKit

// Today I hace realized the power of protocol my god.

class CustomeTabBarController: UIViewController, tabbarDelegate, tabdel, comunicateToCustome {
    
    
    func communicateToHome() {
        resetTabIcons()
        didTapCart()
    }
    
    
    func homedelegate() {
        
        print(" we came here. ")
        resetTabIcons()
        didTapHome()
    }
    
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var cartImageView: UIImageView!
    @IBOutlet weak var accountImageView: UIImageView!

    var currentViewController: UIViewController?
    
   weak var detailCartControllerReference: DetailBookViewController?

     
    @IBOutlet weak var customeTabBarView: UIView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        detailCartControllerReference?.delegate = self
      
        // Add tap gestures to each image view
        addTapGestures()
        homeImageView.image = UIImage(named: "home")
        
        // Navigate to the home page on load
        navigateHomePage()
       
        
    }
    
    func selectCart() {
        print("second stage..")
        categoryImageView.image = UIImage(named: "search (1)")
    }
    

    func navigateHomePage() {
        navigateToViewController(withIdentifier: "HomeViewController")
    }
    

    private func addTapGestures() {        let homeTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapHome))
        homeImageView.addGestureRecognizer(homeTapGesture)
        homeImageView.isUserInteractionEnabled = true

        let categoryTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapCategory))
        categoryImageView.addGestureRecognizer(categoryTapGesture)
        categoryImageView.isUserInteractionEnabled = true

        let cartTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapCart))
        cartImageView.addGestureRecognizer(cartTapGesture)
        cartImageView.isUserInteractionEnabled = true

        let accountTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapAccount))
        accountImageView.addGestureRecognizer(accountTapGesture)
        accountImageView.isUserInteractionEnabled = true
    }

    @objc public func didTapHome() {
        resetTabIcons()
        homeImageView.image = UIImage(named: "home")
        navigateHomePage()
    }

    @objc public func didTapCategory() {
        resetTabIcons()
        categoryImageView.image = UIImage(named: "search (1)")
        navigateToViewController(withIdentifier: "CategoryViewController")
    }

    @objc private func didTapCart() {
        resetTabIcons()
        cartImageView.image = UIImage(named: "cart (1)")
        navigateToViewController(withIdentifier: "PurchseCartViewController")
    }

    @objc private func didTapAccount() {
        resetTabIcons()
        accountImageView.image = UIImage(named: "account (1)")
        navigateToViewController(withIdentifier: "AccountViewController")
    }

    public func resetTabIcons() {
        homeImageView.image = UIImage(named: "home (1)")
        categoryImageView.image = UIImage(named: "search (2)")
        cartImageView.image = UIImage(named: "cart")
        accountImageView.image = UIImage(named: "account")
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
        
        if let homeVC = vc as? PurchseCartViewController {
               homeVC.delegate = self // Assign delegate if HomeViewController
           }
        
        if let homevc = vc as? HomeViewController {
            homevc.delegate = self
        }


        // Add the new view controller
        addChild(vc)
        vc.view.frame = contentView.bounds // Match the size of contentView
        contentView.addSubview(vc.view)
        vc.didMove(toParent: self)

        // Update the current view controller reference
        currentViewController = vc
    }
}








