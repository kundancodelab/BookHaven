//
//  CategoryViewController.swift
//  BookHaven
//
//  Created by User on 03/09/24.
//

import UIKit

class CategoryViewController: UIViewController, CollectionViewSetup {
    
   
    // Outlets
    @IBOutlet weak var BookCatagoryCollectionView: UICollectionView!
    
    @IBOutlet weak var mainViewFortapGesture: UIView!
    
    @IBOutlet weak var PriceRangeLabel: UILabel!
    
    @IBOutlet weak var priceRangeSlider: UISlider!
    
    @IBOutlet weak var hidenFilterView: UIView!
    
    @IBOutlet weak var backArrowButtonPressed: UIButton!
    
    @IBOutlet weak var showResultBook: UIButton!
    
    @IBOutlet weak var hardCoreButton: UIButton!
    
    @IBOutlet weak var peperBackButton: UIButton!
    
     var flag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  Use the protocol method to set up the collectionview.
        BookCatagoryCollectionView.delegate = self
        
        setupCollection(collectionView: BookCatagoryCollectionView)
        
        // Register the indetifier for  uicollectionviewcell and for headerview.
         registerCollectionView(BookCatagoryCollectionView)
        
        addingTapgestureForMainview(mainViewFortapGesture)
        
        setupPriceRangeSlider()
        // intially  hide the filerview
        hidenFilterView.isHidden = true
        
        // configure the hard core button.
        configureHardCoreButton()
        
        
    }
    // this method is adding tap gesture on the mainview.
    func addingTapgestureForMainview ( _ mainViewFortapGesture: UIView){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
          mainViewFortapGesture.addGestureRecognizer(tapGesture)
    }
    // This method is configuring the hardCoreButon outlet.
    func configureHardCoreButton () {
//        hardCoreButton.titleLabel?.textColor = .black
        hardCoreButton.layer.borderWidth = 2
        hardCoreButton.layer.borderColor = UIColor(red: 0.07, green: 0.07, blue: 0.07, alpha: 1.00).cgColor
        hardCoreButton.clipsToBounds = true
        hardCoreButton.setTitleColor(UIColor.black, for: .normal)
        
    }
    // this method is letting us go back on the previous page.
    @IBAction func didTappedBackArrowButton(_ sender: UIButton) {
        
        hidenFilterView.isHidden = true
        mainViewFortapGesture.backgroundColor = UIColor.clear
    
        
    }
    
    
    // This method is used for showing  the results on the price range that user wants to see or buy
    @IBAction func didTappedshowBookResult(_ sender: UIButton) {
        
        print(" show the books that user are looking for within his or her price range. ")
    }
    
    
    
    // This method used for assigning background color on user selecting.
    func resetButtonStates() {
        // Reset both buttons to default state
        hardCoreButton.backgroundColor = UIColor.clear
        hardCoreButton.setTitleColor(UIColor.black, for: .normal)
        
        peperBackButton.backgroundColor = UIColor.clear
        peperBackButton.setTitleColor(UIColor.black, for: .normal)
        
        // Add any other default styling if needed
        peperBackButton.layer.borderWidth = 2
        peperBackButton.layer.borderColor = UIColor.black.cgColor
        peperBackButton.layer.cornerRadius = 5
        peperBackButton.clipsToBounds = true
    }
    
    
    
    // This method is used for showing books with paperback.
    @IBAction func didTappedPaperBookButton(_ sender: UIButton) {
        print("User wants to see the book that comes with paperback.")
            
            // Reset both buttons first
            resetButtonStates()
            
            // Apply active styles to peperBackButton
            peperBackButton.backgroundColor = .black
            peperBackButton.setTitleColor(UIColor.white, for: .normal)
            
            // Update flag state
            flag = true
    }
    
    
    
    // this method is used for showing books with hardcore.
    @IBAction func didTappedHardcoreButton(_ sender: UIButton) {
        print("User wants to see the book that comes with hardcore.")
            
            // Reset both buttons first
            resetButtonStates()
            
            // Apply active styles to hardCoreButton
            hardCoreButton.backgroundColor = .black
            hardCoreButton.setTitleColor(UIColor.white, for: .normal)
            
            // Update flag state
            flag = false
       
        
    }
    
    
    // this method is used for reset the  user search about price for which the user is looking for books.
    @IBAction func didTappedResetButton(_ sender: UIButton) {
        
        priceRangeSlider.minimumValue = 49
        priceRangeSlider.maximumValue = 1999

        // Set initial label text to match the slider's value
        PriceRangeLabel.text = "Price: Rs 49  - 1999 "
        priceRangeSlider.value = 49
        
        

    }
    
    
    // This is method is setting price silder
    func setupPriceRangeSlider(){
        // Set slider's min and max values
            priceRangeSlider.minimumValue = 49
            priceRangeSlider.maximumValue = 1999

            // Set initial label text to match the slider's value
        PriceRangeLabel.text = "Price: Rs \(Int(priceRangeSlider.value)  ) - 1999 "

            // Add target action for when the slider value changes
            priceRangeSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
    }
    
    // this method is setting the value live if user move right or left slider thumb.
    @objc func sliderValueChanged(_ sender: UISlider) {
        // Update label with the current value of the slider
        let currentValue = Int(sender.value)
        PriceRangeLabel.text = "Price: Rs \(currentValue) - 1999 "
    }
    
    // this method is dismissing the keyboard.
    @objc func dismissKeyboard() {
        // Dismiss the keyboard when tapping on the main view
        mainViewFortapGesture.endEditing(true)
        
        hidenFilterView.isHidden = true
        mainViewFortapGesture.backgroundColor = UIColor.clear
     
    }
   
    
    // This method is registering the collectionView's cell.
    func registerCollectionView(_ collectionView: UICollectionView){
        // Register the cell for the body of the collection view
        let nib = UINib(nibName: "CartCollectionViewCell", bundle: nil)
               collectionView.register(nib, forCellWithReuseIdentifier: "CartCell")

    }

}


extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerview = BookCatagoryCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as! CartCollectionReusableView
            headerview.delegate = self
           // headerview.delegate2 = self 
            return headerview
        default:
            print("something is wrong !!!! ")
        }
        
       return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartCell", for: indexPath) as! CartCollectionViewCell
           // Configure the cell content here
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
           return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Here, we will show the image's in details  whenever user tap on it.
        
        
    }
       
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: BookCatagoryCollectionView.bounds.width , height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth = collectionView.bounds.width
        return CGSize(width: collectionViewWidth / 2 - 10  , height:  130)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
  
    
}



extension CategoryViewController: CategoryDelegate{
    
    
    func didtapFilterButton() {
        
        print("Second stage...")
        dismissKeyboard()
        mainViewFortapGesture.backgroundColor = UIColor(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.80)
        hidenFilterView.isHidden = false
       
        
    }
    
   

    
}






