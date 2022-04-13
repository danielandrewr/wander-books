//
//  ViewController.swift
//  KidReadingApp
//
//  Created by Anastasia Agustine on 06/04/22.
//

import UIKit


class LibraryViewController: UIViewController {
    
    var filter: String = ""
    
    @IBOutlet weak var booksCollection: UICollectionView!
    
    @IBOutlet weak var btnFilter: UIButton!
    
    var books: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        

        // Configure Library Title
        configureTopTitle()
        
        // Sets the View Recently Read
        
        // Shows the data
        books = BookFeeder().seedBook()
        // User Pick's
        
        // Do something else
        booksCollection.dataSource = self
        booksCollection.delegate = self
//        booksCollection.collectionViewLayout = UICollectionViewLayout()
        
        filterPopButton()
    }
    
    /**
        Configures the top title of a View
     */
    private func configureTopTitle() {
        let titleLabel = UILabel()
        titleLabel.text = "Library"
        titleLabel.font = UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.bold)
        //titleLabel.textAlignment = .center
//        self.navigationItem.titleView = titleLabel
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
    }
    
    private func filterPopButton(){
        let option = {(action: UIAction) in
            print(action.title)
            self.btnFilter.setTitle(action.title, for: .normal)
            self.btnFilter.imageView?.image = nil
            
            if let arr = self.btnFilter.menu{
                for chosenMenu in arr.children {
                    if chosenMenu.title == action.title {
                        print(chosenMenu.title)
                        self.filter = chosenMenu.title
                    }
                }
            }
        }
        
        btnFilter.menu = UIMenu(children: [
            UIAction(title: "Fantasy", state: .off, handler: option),
            UIAction(title: "Comedy", state: .off, handler: option),
            UIAction(title: "Drama", state: .off, handler: option)
        ])
        
        btnFilter.showsMenuAsPrimaryAction = true
        btnFilter.changesSelectionAsPrimaryAction = false
    }
    
}

extension LibraryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! LibraryCollectionViewCell
        cell.configure(with: books[indexPath.row])
        
        return cell
    }
}

extension LibraryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 170)
    }
}

extension LibraryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let bookInfoStoryboard = UIStoryboard(name: "BookInformation", bundle: nil)
        let bookInfoVC = bookInfoStoryboard.instantiateViewController(withIdentifier: "BookInformationViewController") as! BookInformationViewController
                        
        // Set selectedGenre's value to the tapped genre.
        bookInfoVC.selectedBook = books[indexPath.row]
                        
        // Take user to genreViewController
        self.navigationController?.pushViewController(bookInfoVC, animated: true)
        
    }
    
}



