//
//  GenreCollectionViewCell.swift
//  KidReadingApp
//
//  Created by Vincensa Regina on 10/04/22.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bookCover: UIImageView!
    @IBOutlet weak var genreName: UILabel!
    
    func setup(with genre: Genre) {
        bookCover.image = genre.image
        genreName.text = genre.name
        
        //Shadow and corner radius
        bookCover.layer.shadowColor = UIColor.black.cgColor
        bookCover.layer.shadowOpacity = 0.5
        bookCover.layer.shadowOffset = CGSize(width: 5.0,height: 5.0)
        bookCover.layer.shadowRadius = 2
        bookCover.clipsToBounds = true
        bookCover.layer.cornerRadius = 8.0
    }
    
}
