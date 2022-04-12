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
        if selectedBook.isOwned {
            bookCoverImage.image = selectedBook.cover
            unlockBookButton.setTitle("Read Book", for: .normal)
        } else {
            bookCoverImage.image = selectedBook.notOwnedCover
        }
        
    }
  
    @IBAction func claimBook(_ sender: UIButton){
        let buttonUnlockLabel = unlockBookButton.titleLabel?.text
        if buttonUnlockLabel == "Unlock Book" {
            selectedBook.isOwned = true
            unlockBookButton.setTitle("Read Book", for: .normal)
        } else {return}
    }

}
