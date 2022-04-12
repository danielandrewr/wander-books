//
//  BookStructure.swift
//  KidReadingApp
//
//  Created by Anastasia Agustine on 06/04/22.
//
import Foundation
import UIKit

struct Book{
    var title: String
    var author: String
    var cover: UIImage?
    var notOwnedCover: UIImage?
    var genre: [String]
    var isOwned: Bool
    var requiredPoints: Int
    var bookPages: [UIImage]?
    var bookTexts: [String]?
    var synopsis: String?
}

struct BookFeeder{
    func seedBook() -> [Book] {
        return [
            Book(title: "The Tortoise and the Hare", author: "Aesop", cover: nil, notOwnedCover: UIImage(named: "Dummy3"), genre: ["fable"], isOwned: false, requiredPoints: 10, bookPages: nil, bookTexts: nil, synopsis: "Di suatu hutan yang dipenuhi dengan kehidupan para hewan, hiduplah seekor kelinci angkuh yang suka merendahkan hewan lain yang lebih lambat daripadanya. Suatu ketika, kelinci menemui seekor kura-kura dan mengajaknya untuk berlomba lari..."),
            Book(title: "My Home is the Sea", author: "Author A", cover: nil, notOwnedCover: UIImage(named: "Dummy1"), genre: ["fable"], isOwned: false, requiredPoints: 10, bookPages: nil, bookTexts: nil),
            Book(title: "Princess and the Goblin", author: "Author B", cover: nil, notOwnedCover: UIImage(named: "Dummy2"), genre: ["fable"], isOwned: false, requiredPoints: 10, bookPages: nil, bookTexts: nil),
            Book(title: "Sunny", author: "Author C", cover: nil, notOwnedCover: UIImage(named: "Dummy4"), genre: ["fable"], isOwned: false, requiredPoints: 10, bookPages: nil, bookTexts: nil)
            
        ]
    }
}

struct Genre {
    var name: String
    var image: UIImage?
}

let genreSeed = [
    Genre(name: "Fantasy", image: UIImage(named: "Dummy1")),
    Genre(name: "Comedy", image: UIImage(named: "Dummy2")),
    Genre(name: "Drama", image: UIImage(named: "Dummy3")),
    Genre(name: "Fairy Tale", image: UIImage(named: "Dummy4")),
    Genre(name: "Horror", image: UIImage(named: "Dummy5")),
    Genre(name: "Mystery", image: UIImage(named: "Dummy6")),
    Genre(name: "TEst!", image: UIImage(named: "Dummy6")),
]
