//
//  CommonProtocols.swift
//  BookHaven
//
//  Created by User on 13/09/24.
//

import Foundation

import UIKit

protocol CollectionViewSetup {
    func setupCollection(collectionView: UICollectionView)
}

extension CollectionViewSetup where Self: UIViewController {
    
    func setupCollection(collectionView: UICollectionView) {
        collectionView.delegate = self as? UICollectionViewDelegate
        collectionView.dataSource = self as? UICollectionViewDataSource
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
       
    }
}

