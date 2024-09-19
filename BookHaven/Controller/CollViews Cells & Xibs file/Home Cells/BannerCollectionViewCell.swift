//
//  BannerCollectionViewCell.swift
//  BookHaven
//
//  Created by User on 04/09/24.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {

    
       @IBOutlet weak var imageView: UIImageView!
       @IBOutlet weak var titleLabel: UILabel!
       @IBOutlet weak var authorLabel: UILabel!
       @IBOutlet weak var priceLabel: UILabel!
    
    
    
    @IBOutlet weak var DiscountPercentage: UIButton!
    
    
    override func layoutSubviews() {
            super.layoutSubviews()
            // Debugging: Print layer.zPosition and alpha
            print("Cell zPosition: \(self.layer.zPosition), alpha: \(self.alpha)")
           
        
        }
    
       func configure(with book: Book) {
           imageView.image = book.image
           titleLabel.text = book.title
           authorLabel.text = book.author
           priceLabel.text = "$\(book.price)"
       }

    
}
