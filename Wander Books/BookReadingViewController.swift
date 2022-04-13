//
//  BookReadingViewController.swift
//  KidReadingApp
//
//  Created by Vincensa Regina on 08/04/22.
//
import UIKit

class BookReadingViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var coverImageView: UIImageView!
    
    private var bookContent = [Book]()
    
    private var currentPage = 0;
    
    var selectedBook: Book = Book(title: "", author: "", genre: [], isOwned: false, requiredPoints: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(selectedBook.title)
        print(selectedBook.bookTexts?[0] ?? "Failed to Load")
        print(selectedBook.isOwned)
        titleLabel.text = selectedBook.title
        authorLabel.text = selectedBook.author
//        let newImage = self.resizeImage(image: selectedBook.cover!, targetSize: CGSize(width: 390, height: 339))
        coverImageView.image = selectedBook.cover

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(onSwipeLeftEvent))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc private func onSwipeLeftEvent() {
        guard let readerViewControl = storyboard?.instantiateViewController(withIdentifier: "BookReader") else {
            return
        }
        readerViewControl.modalPresentationStyle = .fullScreen
        present(readerViewControl, animated: true, completion: nil)
    }
    
//    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
//       let size = image.size
//
//       let widthRatio  = targetSize.width  / size.width
//       let heightRatio = targetSize.height / size.height
//
//       // Figure out what our orientation is, and use that to form the rectangle
//       var newSize: CGSize
//       if(widthRatio > heightRatio) {
//           newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
//       } else {
//           newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
//       }
//
//       // This is the rect that we've calculated out and this is what is actually used below
//       let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
//
//       // Actually do the resizing to the rect using the ImageContext stuff
//       UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
//       image.draw(in: rect)
//       let newImage = UIGraphicsGetImageFromCurrentImageContext()
//       UIGraphicsEndImageContext()
//
//       return newImage!
//   }
}
