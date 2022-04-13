//
//  LibraryCollectionViewCell.swift
//  Wander Books
//
//  Created by Marcelino Budiman on 13/04/22.
//

import UIKit

class LibraryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblBook: UILabel!
    
    @IBOutlet weak var imgBook: UIImageView!
    
    func configure(with book: Book){
        imgBook.image = book.cover
        lblBook.text = book.title
        
        lblBook.font = UIFont.systemFont(ofSize: 11, weight: .bold)
        
        self.imgBook.layer.cornerRadius = 8
        
        self.imgBook.clipsToBounds = true
        
        self.imgBook.layer.shadowOffset = CGSize(width: 5.0,height: 5.0)
        
        self.imgBook.layer.shadowRadius = 2
        
        self.imgBook.layer.shadowOpacity = 0.5
    }
    
}

