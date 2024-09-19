//
//  TestingViewController.swift
//  BookHaven
//
//  Created by User on 10/09/24.
//

import UIKit

class TestingViewController: UIViewController {

    @IBOutlet weak var collView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "BannerCollectionViewCell", bundle: nil)
       self.collView.register(nib, forCellWithReuseIdentifier: "BannerCollectionViewCell")
        
        setupCollectionView(collView)
    }
    
    
    func setupCollectionView(_ collectionView: UICollectionView) {
        
           collectionView.delegate = self
           collectionView.dataSource = self
           collectionView.reloadData()    }


}

extension TestingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collView.dequeueReusableCell(withReuseIdentifier:"BannerCollectionViewCell", for: indexPath) as! BannerCollectionViewCell
        return cell   }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       return CGSize(width: 280, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         print("Selected item is \(indexPath)")
    }
    
    
}
