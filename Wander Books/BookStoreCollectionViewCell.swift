//
//  BookStoreCollectionViewCell.swift
//  KidReadingApp
//
//  Created by Vincensa Regina on 10/04/22.
//

import UIKit

class BookStoreCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bookCover: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    
    func setup(with book: Book) {
        bookCover.image = book.notOwnedCover
        bookTitle.text = book.title
    }
}
