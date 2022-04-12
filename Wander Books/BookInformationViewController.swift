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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrOfBook = feeder.seedBook()
        bookTitleLabel.text = arrOfBook[0].title
//        bookTitleLabel.font = UIFont(name: "SF Pro RoundedBold", size: 21)
        bookAuthorLabel.text = arrOfBook[0].author
        genreListLabel.text = arrOfBook[0].genre[0]
        bookSynopsisTextView.text = arrOfBook[0].synopsis
        if arrOfBook[0].isOwned {
            bookCoverImage.image = arrOfBook[0].cover
            unlockBookButton.setTitle("Read Book", for: .normal)
        } else {
            bookCoverImage.image = arrOfBook[0].notOwnedCover
        }
        
    }
  
    @IBAction func claimBook(_ sender: UIButton){
        let buttonUnlockLabel = unlockBookButton.titleLabel?.text
        if buttonUnlockLabel == "Unlock Book" {
            arrOfBook[0].isOwned = true
            unlockBookButton.setTitle("Read Book", for: .normal)
        } else {return}
    }

}
