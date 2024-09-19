import UIKit

protocol comunicateToCustome : AnyObject{
    func communicateToHome()
}

class HomeViewController: UIViewController, tabbarDelegate {
    func selectCart() {
        
        delegate?.communicateToHome()
    }
    
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    
    @IBOutlet weak var BooksCollectionView: UICollectionView!
    
    @IBOutlet weak var BooksCllectionview2: UICollectionView!
    
    @IBOutlet weak var BooksCollectionView3: UICollectionView!
    var books: [Book] = []
    var currentViewController: UIViewController?
    
    @IBOutlet weak var contentView: UIView!
    var flag = true

   weak var delegate: comunicateToCustome?

    
    var images: [String] = ["book_cover", "book_cover", "book_cover", "book_cover", "book_cover"]
    
    var currentIndex = 0
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Start the automatic banner cycling
       
        addDataIntoArrays()
        registerXibfile(bannerCollectionView, "BannerCollectionViewCell")
        registerXibfile(BooksCollectionView, "BookCollectionViewCell1")
        registerXibfile(BooksCllectionview2, "BookCollectionViewCell2")
        registerXibfile(BooksCollectionView3, "BookCollectionViewCell3")
        setupCollectionView(bannerCollectionView)
        setupCollectionView(BooksCollectionView)
        setupCollectionView(BooksCllectionview2)
        setupCollectionView(BooksCollectionView3)
        
        // Add page controller in its properties.........
        pageController.numberOfPages = books.count
        pageController.currentPage = 0
        startAutoScroll()
    }
    
    func registerXibfile(_ collectionView: UICollectionView, _ identifier: String){
        
        // Register the XIB file for the collection view cell
        let nib = UINib(nibName: identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
        
    }
    
    func addDataIntoArrays() {
        
        let book1 = Book(title: "Tuesday Mooney Talks to Ghosts", price: 29.99, author: "John Appleseed", type: "Programming", image: UIImage(named: "book_cover")!)
        let book2 = Book(title: "Tuesday Mooney Talks to Ghosts", price: 19.99, author: "Sun Tzu", type: "Philosophy", image: UIImage(named: "book_cover")!)
        let book3 = Book(title: "Tuesday Mooney Talks to Ghosts", price: 24.99, author: "Jane Doe", type: "Programming", image: UIImage(named: "book_cover")!)
        let book4 = Book(title: "Tuesday Mooney Talks to Ghosts", price: 24.99, author: "Jane Doe", type: "Programming", image: UIImage(named: "book_cover")!)
        let book5 = Book(title: "Tuesday Mooney Talks to Ghosts", price: 24.99, author: "Jane Doe", type: "Programming", image: UIImage(named: "book_cover")!)
        let book6 = Book(title: "Tuesday Mooney Talks to Ghosts", price: 24.99, author: "Jane Doe", type: "Programming", image: UIImage(named: "book_cover")!)
        let book7 = Book(title: "Tuesday Mooney Talks to Ghosts", price: 24.99, author: "Jane Doe", type: "Programming", image: UIImage(named: "book_cover")!)
        let book8 = Book(title: "Tuesday Mooney Talks to Ghosts", price: 24.99, author: "Jane Doe", type: "Programming", image: UIImage(named: "book_cover")!)
        
        books = [book1, book2, book3, book4, book5, book6, book7, book8]
    }
    func setupCollectionView(_ collectionView: UICollectionView) {
        
        
        // Set delegate and data source
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // Force layout update
        bannerCollectionView.collectionViewLayout.invalidateLayout()
        bannerCollectionView.layoutIfNeeded()
    }
    
    // Function to start auto-scrolling the banner
    func startAutoScroll() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(scrollToNext), userInfo: nil, repeats: true)
    }
    
    // Function to stop the auto-scrolling (if needed)
    func stopAutoScroll() {
        timer?.invalidate()
        timer = nil
    }
    
    // Scroll to the next banner image
    @objc func scrollToNext() {
        currentIndex = (currentIndex + 1) % images.count
        let indexPath = IndexPath(item: currentIndex, section: 0)
        
        bannerCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        // Update the page controller
        pageController.currentPage = currentIndex
    }
    
    private func navigateToViewController(withIdentifier identifier: String) {
        // Remove the current view controller if there is one
        if let currentVC = currentViewController {
            currentVC.view.removeFromSuperview()
            currentVC.removeFromParent()
        }

        // Instantiate the new view controller
        guard let vc = storyboard?.instantiateViewController(withIdentifier: identifier) else {
            return
        }

        
        if let detailVC = vc as? DetailBookViewController {
               detailVC.delegate = self // Assign delegate if HomeViewController
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

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case bannerCollectionView:
            return books.count
        case BooksCollectionView:
            return 100
        case BooksCllectionview2:
            return 20
        case BooksCollectionView3:
            return 30
            
            
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case bannerCollectionView:
            let cell = self.bannerCollectionView.dequeueReusableCell(withReuseIdentifier:"BannerCollectionViewCell", for: indexPath) as! BannerCollectionViewCell
            
           // let imageName = images[indexPath.row]
           // cell.imageView.image = UIImage(named: imageName) // Assuming `BannerCollectionViewCell` has an `imageView` outlet
            cell.DiscountPercentage.layer.cornerRadius = 3
            
            if flag  {
                cell.imageView.image = UIImage(named: "image 26")
                flag = !flag
            }else{
                cell.imageView.image = UIImage(named: "image 15")
                flag = !flag
            }
            
            cell.layer.cornerRadius = 8
            cell.clipsToBounds = true

            return cell
        case BooksCollectionView:
            let cell2 = BooksCollectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell1", for: indexPath) as! BookCollectionViewCell1
            if flag  {
                cell2.bookImage.image = UIImage(named: "image 26")
                flag = !flag
            }else{
                cell2.bookImage.image = UIImage(named: "image 15")
                flag = !flag
            }
            
            cell2.layer.cornerRadius = 8
            cell2.clipsToBounds = true
            return cell2
        case BooksCllectionview2:
            let cell3 = self.BooksCllectionview2.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell2", for: indexPath) as! BookCollectionViewCell2
            if flag  {
                cell3.bookImage.image = UIImage(named: "image 26")
                flag = !flag
            }else{
                cell3.bookImage.image = UIImage(named: "image 15")
                flag = !flag
            }
            cell3.layer.cornerRadius = 8
            cell3.clipsToBounds =   true
                
            return cell3
            
            
        case BooksCollectionView3:
            let cell4 = self.BooksCollectionView3.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell3", for: indexPath) as!  BookCollectionViewCell3
            
            if flag  {
             cell4.bookCoverImage.image = UIImage(named: "image 28")
                flag = !flag
            }else{
                cell4.bookCoverImage.image = UIImage(named: "image 29")
                flag = !flag
            }
            
            cell4.layer.cornerRadius = 8
            cell4.clipsToBounds = true
            return cell4
            
        default:
            return UICollectionViewCell()
        }
        
    }
 
    
    
    
    
    // Ensure the correct cell size is set for the banner
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case bannerCollectionView:
            return CGSize(width:bannerCollectionView.bounds.width / 1.30 - 10   , height: bannerCollectionView.bounds.height)
        case BooksCollectionView:
            return CGSize(width:BooksCollectionView.bounds.width / 2 - 10    , height: BooksCollectionView.bounds.height)
        case BooksCllectionview2:
            return CGSize(width:BooksCllectionview2.bounds.width / 2 - 10    , height: BooksCllectionview2.bounds.height)
        case BooksCollectionView3:
            return CGSize(width:BooksCollectionView3.bounds.width / 2 - 10    , height:BooksCollectionView3.bounds.height / 1.25 )
            
            
            
        default:
             return CGSize()
        }
        
    }
    

    
    // Update the page controller when the user scrolls manually
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageController.currentPage = page
        currentIndex = page
    }
    
    
    // Handle selection of a banner image (optional)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected banner at index: \(indexPath.row)")
        
        
        
        switch collectionView {
            
        case bannerCollectionView:
            
           // let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            if let detailVC = self.storyboard?.instantiateViewController(identifier: "DetailBookViewController") as? DetailBookViewController{
                // Send the selected book data to the DetailBookViewController
//                let selectedBook = books[indexPath.row]
//                detailVC.bookImage = selectedBook.image
//                detailVC.bookTitle = selectedBook.title
//                detailVC.bookAuthor = selectedBook.author
//                detailVC.bookPrice = String(selectedBook.price)
              //  self.navigationController?.pushViewController(detailVC, animated: true)
               // detailVC.bookDescription = selectedBook.description
            
            navigateToViewController(withIdentifier: "DetailBookViewController")
                
                

               
        case BooksCollectionView:
//            if let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailBookViewController") as? DetailBookViewController {
//                // Send the selected book data to the DetailBookViewController
//                let selectedBook = books[indexPath.row]
//                detailVC.bookImage = selectedBook.image
//                detailVC.bookTitle = selectedBook.title
//                detailVC.bookAuthor = selectedBook.author
//                detailVC.bookPrice = String(selectedBook.price)
//               // detailVC.bookDescription = selectedBook.description
//                self.navigationController?.pushViewController(detailVC, animated: true)
            
            navigateToViewController(withIdentifier: "DetailBookViewController")
        case BooksCllectionview2:
//            if let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailBookViewController") as? DetailBookViewController {
//                // Send the selected book data to the DetailBookViewController
//                let selectedBook = books[indexPath.row]
//                detailVC.bookImage = selectedBook.image
//                detailVC.bookTitle = selectedBook.title
//                detailVC.bookAuthor = selectedBook.author
//                detailVC.bookPrice = String(selectedBook.price)
//               // detailVC.bookDescription = selectedBook.description
//                self.navigationController?.pushViewController(detailVC, animated: true)
//            }
            navigateToViewController(withIdentifier: "DetailBookViewController")
        case BooksCollectionView3:
//            if let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailBookViewController") as? DetailBookViewController {
//                // Send the selected book data to the DetailBookViewController
//                let selectedBook = books[indexPath.row]
//                detailVC.bookImage = selectedBook.image
//                detailVC.bookTitle = selectedBook.title
//                detailVC.bookAuthor = selectedBook.author
//                detailVC.bookPrice = String(selectedBook.price)
//               // detailVC.bookDescription = selectedBook.description
//                self.navigationController?.pushViewController(detailVC, animated: true)
//                self.didMove(toParent: detailVC)
//            }
            navigateToViewController(withIdentifier: "DetailBookViewController")
            
        default:
            print("fatar error")
        }
    }
}



