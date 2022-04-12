//
//  GenreViewController.swift
//  KidReadingApp
//
//  Created by Vincensa Regina on 11/04/22.
//

import UIKit

class GenreViewController: UIViewController {

    @IBOutlet weak var genreCollectionView: UICollectionView!    
    var selectedGenre : String?
    var bookSeed: [Book] = []
    var filteredBook: [Book] = []
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Set genre title
        title = selectedGenre
        
        //Take book data from feeder
        bookSeed = BookFeeder().seedBook()
        
        //Filter the books
        for book in bookSeed {
            if book.genre.contains(selectedGenre ?? "No genre selected") {
                filteredBook.append(book)
            }
        }
        
        
        //Collection view configuration
        genreCollectionView.dataSource = self
        genreCollectionView.delegate = self
        
        //Screen size
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height

        //genreCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
    }
}

extension GenreViewController: UICollectionViewDataSource {
    //Fill the cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = genreCollectionView?.dequeueReusableCell(withReuseIdentifier: "SpecificGenreCollectionViewCell", for: indexPath) as! SpecificGenreCollectionViewCell
        cell.setup(with: filteredBook[indexPath.row])
        return cell
    }
    
    //number of items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredBook.count
    }
}

//Set each item's size
extension GenreViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 170)
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return -10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 20
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
}
