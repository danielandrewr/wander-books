//
//  BookInformationViewController.swift
//  KidReadingApp
//
//  Created by Vincensa Regina on 08/04/22.
//
import UIKit

class BookInformationViewController: UIViewController {

    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookAuthorLabel: UILabel!
    @IBOutlet weak var bookSynopsisTextView: UITextView!
    @IBOutlet weak var genreListLabel: UILabel!
    @IBOutlet weak var bookCoverImage: UIImageView!
    @IBOutlet weak var unlockBookButton: UIButton!
    
    //BookDummyData
    var arrOfBook :[Book] = []
    var feeder = BookFeeder()
    var selectedBook: Book = Book(title: "", author: "", genre: [], isOwned: false, requiredPoints: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedBook.isOwned)
        arrOfBook = feeder.seedBook()
        bookTitleLabel.text = selectedBook.title
//        bookTitleLabel.font = UIFont(name: "SF Pro RoundedBold", size: 21)
        bookAuthorLabel.text = selectedBook.author
        
        genreListLabel.text! = ""
        for (index, genre) in selectedBook.genre.enumerated() {
            if index == selectedBook.genre.count - 1 {
                genreListLabel.text! += "\(genre)"
            } else {
                genreListLabel.text! += "\(genre), "
            }
        }

        bookSynopsisTextView.text = selectedBook.synopsis
        checkBookStatus()
    }
    
    private func checkBookStatus() {
        let status = selectedBook.isOwned
        let unlockBtnTitle = (status == true) ? "Read Book" : "Unlock Book"
        unlockBookButton.setTitle(unlockBtnTitle, for: .normal)
        
        if status == false {
            bookCoverImage.image = selectedBook.notOwnedCover
        } else {
            bookCoverImage.image = selectedBook.cover
        }
    }
    
    @IBAction func onButtonPressed(_ sender: Any) {
        if (unlockBookButton.titleLabel?.text == "Read Book") {
            let bookReadingViewController = UIStoryboard(name: "BookReading", bundle: nil)
            let bookReading = bookReadingViewController.instantiateViewController(withIdentifier: "BookCover") as! BookReadingViewController
            bookReading.selectedBook = selectedBook
            
            self.navigationController?.pushViewController(bookReading, animated: true)
        } else {
            // buy book
        }
    }
}
