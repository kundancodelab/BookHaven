//
//  PurchseCartTableViewCell.swift
//  BookHaven
//
//  Created by User on 15/09/24.
//

import UIKit

class PurchseCartCollViewCell: UICollectionViewCell {

    @IBOutlet weak var bookCoverImage: UIImageView!
    
    
    @IBOutlet weak var bookjTypeLabel: UILabel!
    
   
    
    @IBOutlet weak var bookTitle: UILabel!
    
    @IBOutlet weak var bookAuthor: UILabel!
    
    
    @IBOutlet weak var stepperValueLabel: UILabel!
    
    var currentValue =  1
    
    @IBOutlet weak var bookPriceLabel: UILabel!
    
    @IBOutlet weak var bookView: UIView!
    
    @IBOutlet weak var decreseButton: UIButton!
    
    @IBOutlet weak var increaseButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureBookView(bookView)
        configureButton(decreseButton)
        configureButton(increaseButton)
    }

   
    func configureButton(_ button: UIButton){
        button.layer.cornerRadius = 3
        button.clipsToBounds = true
    }
    
    func configureBookView(_ bookView: UIView){
        
        bookView.layer.cornerRadius = 6
        bookView.clipsToBounds = true
    }
    @IBAction func decreaseValue(_ sender: UIButton) {
        if currentValue > 1 {
            currentValue -= 1
            stepperValueLabel.text = "\(currentValue)"
        }
    }

    @IBAction func increaseValue(_ sender: UIButton) {
        currentValue += 1
        stepperValueLabel.text = "\(currentValue)"
    }

}
