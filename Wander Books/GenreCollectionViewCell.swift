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
    }
    
}
