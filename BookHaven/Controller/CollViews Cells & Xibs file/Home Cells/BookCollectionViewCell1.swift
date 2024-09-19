//
//  BookCollectionViewCell1.swift
//  BookHaven
//
//  Created by User on 10/09/24.
//

import UIKit

class BookCollectionViewCell1: UICollectionViewCell {

    @IBOutlet weak var bookImage: UIImageView!
    
    @IBOutlet weak var bookType: UILabel!
    
    @IBOutlet weak var bookTitle: UILabel!
    
    @IBOutlet weak var authorName: UILabel!
    
    @IBOutlet weak var bookPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
