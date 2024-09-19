import UIKit

protocol CategoryDelegate: AnyObject {
    func didtapFilterButton()
    
}

class CartCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var seachBookTextfield: UITextField!
    @IBOutlet weak var DidtapFilterGesture: UIView!
    
    @IBOutlet weak var filteview: UIView!
    weak var delegate:CategoryDelegate?
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Setup the text field and other UI elements here
        filteview.layer.cornerRadius = 5
        filteview.clipsToBounds = true
        
        configureSearchTextField()
        
        // Optionally, set the delegate for the text field
        seachBookTextfield.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(filterAction))
        DidtapFilterGesture.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func filterAction(){
        
        print("first stage...")
        
        
        delegate?.didtapFilterButton()
       
    }
    
    func configureSearchTextField() {
        // Create an image view with the search icon
        let searchIcon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        searchIcon.tintColor = .black

        // Create a container view for the icon
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        iconContainerView.addSubview(searchIcon)
        searchIcon.frame = CGRect(x: 15, y: 5, width: 24, height: 20)

        // Set the leftView of the textField
        seachBookTextfield.leftView = iconContainerView
        seachBookTextfield.leftViewMode = .always
        let placeholderText = seachBookTextfield.placeholder
        let placeholderColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
        seachBookTextfield.attributedPlaceholder = NSAttributedString(
            string: placeholderText ?? "Search Book title / ISBN No",
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
        )
    }
}

extension CartCollectionReusableView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        seachBookTextfield.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        performSearch(with: textField.text ?? "")
        return true
    }
    
    func performSearch(with query: String) {
        print("User searched for: \(query)")
    }
}
