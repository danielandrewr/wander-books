//
//  BookStoreViewController.swift
//  KidReadingApp
//
//  Created by Daniel Roong on 07/04/22.
//

import UIKit

class BookStoreViewController: UIViewController {
    
    @IBOutlet weak var recommendCollectionView: UICollectionView?
    @IBOutlet weak var genreCollectionView: UICollectionView!
    @IBOutlet weak var coinAmount: UILabel!
    
    private var bookSeed: [Book]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //Take book data from feeder
        bookSeed = BookFeeder().seedBook()
        
        //Collection view configuration
        recommendCollectionView?.dataSource = self
        genreCollectionView.dataSource = self
        genreCollectionView.delegate = self
        genreCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        coinAmount.text = "\(userCoin)"
    }
    
}

extension BookStoreViewController: UICollectionViewDataSource {
    //Number of items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == recommendCollectionView) {
            return bookSeed?.count ?? 0
        } else {
            return genreSeed.count
        }
    }
    
    //Fill the cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == recommendCollectionView) {
            let cell = recommendCollectionView?.dequeueReusableCell(withReuseIdentifier: "BookStoreCollectionViewCell", for: indexPath) as! BookStoreCollectionViewCell
            cell.setup(with: bookSeed?[indexPath.row] ??
                       Book(title: "Empty!", author: "No Author", cover: nil, notOwnedCover: nil, genre: ["No genre"], isOwned: false, requiredPoints: 10, bookPages: nil, bookTexts: nil))
            return cell
        } else {
            let cell = genreCollectionView?.dequeueReusableCell(withReuseIdentifier: "GenreCollectionViewCell", for: indexPath) as! GenreCollectionViewCell
            cell.setup(with: genreSeed[indexPath.row])
            return cell
        }
        
    }
}

//Tap the data
extension BookStoreViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == recommendCollectionView {
        
            let bookInfoStoryboard = UIStoryboard(name: "BookInformation", bundle: nil)
            let bookInfoVC = bookInfoStoryboard.instantiateViewController(withIdentifier: "BookInformationViewController") as! BookInformationViewController
                
            // Set selectedGenre's value to the tapped genre.
            bookInfoVC.selectedBook = bookSeed?[indexPath.row] ?? Book(title: "", author: "", genre: [], isOwned: false, requiredPoints: 0)
                
            // Take user to genreViewController
            self.navigationController?.pushViewController(bookInfoVC, animated: true)
           
           
        } else {
            print(genreSeed[indexPath.row].name)
            let genreViewController = self.storyboard?.instantiateViewController(withIdentifier: "GenreViewController") as! GenreViewController
                
            // Set selectedGenre's value to the tapped genre.
            genreViewController.selectedGenre = genreSeed[indexPath.row].name
                
            // Take user to genreViewController
            self.navigationController?.pushViewController(genreViewController, animated: true)
        }
    }
}

//Set each item's size
extension BookStoreViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == genreCollectionView {
            return CGSize(width: 100, height: 140)
        }
        return CGSize(width: 125, height: 200)
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 20
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 20
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
}
