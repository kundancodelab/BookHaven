//
//  footerCollectionReusableView.swift
//  BookHaven
//
//  Created by User on 15/09/24.
//

import UIKit

class footerCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var proceedCheckoutBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureBtnn(proceedCheckoutBtn)
    }
    
    func configureBtnn(_ button: UIButton){
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
    }
    
    @IBAction func didtapProceedCheckoutButton(_ sender: UIButton) {
        // Handle button tap
        print("Proceed to Checkout button tapped")
    }
}
