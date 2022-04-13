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
        let contentBook = UIStoryboard(name: "ContentBookReading", bundle: nil)
        let readerViewControl = contentBook.instantiateViewController(withIdentifier: "BookReader") as! ContentBookReadingViewController
        readerViewControl.modalPresentationStyle = .fullScreen
        readerViewControl.selectedBook = selectedBook
        present(readerViewControl, animated: true, completion: nil)
    }
}
