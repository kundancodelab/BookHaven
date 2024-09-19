//
//  PurchseCartViewController.swift
//  BookHaven
//
//  Created by User on 15/09/24.
//

import UIKit

protocol tabdel : AnyObject {
  func homedelegate()
}

class PurchseCartViewController: UIViewController , CollectionViewSetup{

    @IBOutlet weak var arrowBackButton: UIButton!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var cartCollView: UICollectionView!
    var itemArray:[Book] = []
    
    var btnTag : Int? 
    var currentViewController:UIViewController?
    
    weak var delegate : tabdel?
     
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupCollection(collectionView: cartCollView)
        
        if let tag = btnTag {
            
            print(" we are assigning tag into button. ")
            
            arrowBackButton.tag = tag
            
        }else{
            
            arrowBackButton.tag = 100
        }
      
        
        
    }
    
  
    
    @IBAction func didTappedgoBackControllerButton(_ sender: UIButton) {
        
        print(" Here we will be checking whether sender.tag  is 1 or any other big digit.")
        print(sender.tag)
         
        if btnTag != 1 {
            // go back to the  home page.
            
            delegate?.homedelegate()
           navigateToViewController(withIdentifier: "HomeViewController")
          
            
        }
       
        
        // Check if the current view controller has a parent view controller
        if let currentVC = self.parent {
              print(" I am removing the current vc whatever is there in the  navigation controller. ")
               self.view.removeFromSuperview() // Remove current view
               self.removeFromParent() // Remove current VC from parent

               // Re-add the previous view controller's view back
               currentVC.view.frame = view.bounds
               self.view.superview?.addSubview(currentVC.view)  // Add it back to the view hierarchy
              // currentViewController = nil
           }
    }
    
    private func navigateToViewController(withIdentifier identifier: String) {
        
        // Remove the current view controller if there is one
        if let currentVC = currentViewController {
           
            currentVC.view.removeFromSuperview()
            currentVC.removeFromParent()
        }

        // Instantiate the new view controller
        guard let vc = storyboard?.instantiateViewController(withIdentifier: identifier)   else {
            return
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


extension PurchseCartViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        
        switch kind {
        case UICollectionView.elementKindSectionFooter:
            let footerview = cartCollView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footerCollectionReusableView", for: indexPath) as! footerCollectionReusableView
          
            
           // headerview.delegate2 = self
            
            return footerview
        default:
            print("something is wrong !!!! ")
        }
        
       return UICollectionReusableView()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.cartCollView.dequeueReusableCell(withReuseIdentifier: "PurchseCartCollViewCell", for: indexPath) as! PurchseCartCollViewCell
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: cartCollView.bounds.width / 1.02, height: 145)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: cartCollView.bounds.width , height: 240)
    }
    
   
    
}
