//
//  ViewController.swift
//  KidReadingApp
//
//  Created by Anastasia Agustine on 06/04/22.
//

import UIKit


class LibraryViewController: UIViewController {
    
    var listBook: [Book] = []

    @IBOutlet weak var navLibrary: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Configure Library Title
        configureTopTitle()
        
        // Sets the View Recently Read
        
        // Shows the data
        
        // User Pick's
        
        // Do something else
    }
    
    /**
        Configures the top title of a View
     */
    private func configureTopTitle() {
        let titleLabel = UILabel()
        titleLabel.text = "Library"
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)
        titleLabel.textAlignment = .center
        self.navigationItem.titleView = titleLabel
    }
   
}
