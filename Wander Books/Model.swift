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
            Book(title: "The Tortoise and the Hare", author: "Aesop", cover: UIImage(named: "Dummy1"), notOwnedCover: UIImage(named: "Dummy1"), genre: ["Fable", "Fantasy", "Comedy"], isOwned: true, requiredPoints: 10, bookPages: nil, bookTexts: ["Pada suatu ketika, hiduplah seekor kelinci. Si kelinci menghabiskan sepanjang hari membual ke hewan lain mengenai kemampuan berlalrinya. “Lihatlah seberapa cepat aku bisa berlari!", "Si kelinci berlalri melintasi lapangan secepat mungkin. Semua hewan setuju bahwa si kelinci sangat cepat.", "Kemudian, si kelinci melihat seekor kura-kura dari kejauhan. Si kelinci menertawai si kura-kura dan berkata, “Aku adalah pelari tercepat di hutan ini dan kamu adalah yang paling lambat! Kita harus melakukan lomba lari!”.  Si kura-kura yang sudah lelah dengan kesombongan kelinci pun menyetujui hal tersebut.", "Keesokan harinya, semua hewan di hutan berkumpul untuk menyaksikan kompetisi tersebut. Semuanya ingin melihat apakah si kura-kura bisa mengalahkan kelinci.", "Si beruang memulai lomba dengan berteriak, “Bersiap… dan mulai!” ", "Si kelinci langsung berlari sekencang mungkin, jauh mendahului kura-kura. Kelinci terus berlari sampai kura-kura tidak lagi terlihat sampai ujung mata memandang. “Tidak usah buru-buru!” teriak kelinci kepada kura-kura. “Aku bisa saja menikmati makanan sekarang dan akan tetap menang!”", "Puas dengan hasilnya, kelinci sombong itu mengambil waktunya untuk beristirahat di sebelah pohon. Keteduhan pohon yang sejuk sangat menenangkan si kelinci sehingga ia tertidur pulas.", "Sementara itu, si kura-kura terus berjalan perlahan melintasi lapangan. Akhirnya, kura-kura melihat kelinci yang sedang tertidur pulas di bawah pohon dan berjalan melewatinya.  ", "Para hewan yang menonton pertandingan ini menjadi semakin semangat. “Ayo, kura-kura!” teriak hewan-hewan lain. “Sedikit lagi. Maju terus, kawan!”", "Mendengar suara teriakan dari kejauhan, kelinci pun terbangun. Ia melihat ke seberang lapangan dan tampak si kura-kura sudah akan mencapai garis akhir. Dengan cepat, kelinci langsung berlari untuk mengejar.", "Tetapi, kelinci sudah terlambat. Si kura-kura telah memenangkan pertandingan. “Kamu tidak selalu harus menjadi yang tercepat untuk menang,” ucap kura-kura kepada kelinci, yang sedang menangis tersedu-sedu."], synopsis: "Di suatu hutan yang dipenuhi dengan kehidupan para hewan, hiduplah seekor kelinci angkuh yang suka merendahkan hewan lain yang lebih lambat daripadanya. Suatu ketika, kelinci menemui seekor kura-kura dan mengajaknya untuk berlomba lari..."),
            Book(title: "My Home is the Sea", author: "Author A", cover: nil, notOwnedCover: UIImage(named: "Dummy1"), genre: ["fable"], isOwned: false, requiredPoints: 10, bookPages: nil, bookTexts: nil, synopsis: "Di suatu hutan yang dipenuhi dengan kehidupan para hewan, hiduplah seekor kelinci angkuh yang suka merendahkan hewan lain yang lebih lambat daripadanya. Suatu ketika, kelinci menemui seekor kura-kura dan mengajaknya untuk berlomba lari..."),
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
