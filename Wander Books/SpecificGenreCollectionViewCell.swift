//
//  SpecificGenreCollectionViewCell.swift
//  KidReadingApp
//
//  Created by Vincensa Regina on 11/04/22.
//

import UIKit

class SpecificGenreCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bookCover: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    
    func setup(with book: Book) {
        if book.isOwned {
            bookCover.image = book.cover
        } else {
            bookCover.image = book.notOwnedCover
        }
        bookTitle.text = book.title
        
        //Shadow and corner radius
        bookCover.layer.shadowColor = UIColor.black.cgColor
        bookCover.layer.shadowOpacity = 0.5
        bookCover.layer.shadowOffset = CGSize(width: 5.0,height: 5.0)
        bookCover.layer.shadowRadius = 2
        bookCover.clipsToBounds = true
        bookCover.layer.cornerRadius = 8.0
    }
}
