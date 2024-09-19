//
//  BookCollectionViewCell2.swift
//  BookHaven
//
//  Created by User on 10/09/24.
//

import UIKit

class BookCollectionViewCell2: UICollectionViewCell {
    @IBOutlet weak var bookImage: UIImageView!
    
    @IBOutlet weak var bookType: UILabel!
    @IBOutlet weak var bookTitle: UILabel!
    
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
