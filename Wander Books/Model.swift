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
            Book(title: "The Tortoise and the Hare", author: "Aesop", cover: UIImage(named: "TortoiseHare"), notOwnedCover: UIImage(named: "TortoiseHare-notOwned"), genre: ["Fable"], isOwned: true, requiredPoints: 50, bookPages: nil, bookTexts: nil, synopsis: "Di suatu hutan yang dipenuhi dengan kehidupan para hewan, hiduplah seekor kelinci angkuh yang suka merendahkan hewan lain yang lebih lambat daripadanya. Suatu ketika, kelinci menemui seekor kura-kura dan mengajaknya untuk berlomba lari..."),
            Book(title: "My Home is the Sea", author: "Riki Levinson", cover: UIImage(named: "HomeSea"), notOwnedCover: UIImage(named: "HomeSea-notOwned"), genre: ["Fantasy", "Drama"], isOwned: false, requiredPoints: 30, bookPages: nil, bookTexts: nil, synopsis: "Seorang anak laki-laki bergegas melalui jalan-jalan kota yang ramai di Hong Kong - melewati pasar yang ramai, gedung-gedung tinggi, dan burung merak di taman - mengantisipasi keesokan paginya ketika dia akan bergabung dengan ayah dan kakeknya di laut."),
            Book(title: "Princess and the Goblin", author: "George Macdonald", cover: UIImage(named: "PrincessGoblin"), notOwnedCover: UIImage(named: "PrincessGoblin-notOwned"), genre: ["Fantasy","Comedy", "Fairy Tale", "Adventure"], isOwned: false, requiredPoints: 50, bookPages: nil, bookTexts: nil, synopsis: "Penemuan Putri Irene tentang tangga rahasia mengarah pada wahyu yang luar biasa. Pada saat yang sama, Curdie sengaja mendengar plot jahat oleh para goblin. Putri Irene & Curdie harus memahami pengetahuan mereka yang terpisah & menggagalkan skema para goblin."),
            Book(title: "Sunny", author: "Jason Reynolds", cover: UIImage(named: "Sunny"), notOwnedCover: UIImage(named: "Sunny-notOwned"), genre: ["Comedy", "Drama"], isOwned: false, requiredPoints: 50, bookPages: nil, bookTexts: nil, synopsis: "Empat anak dari latar belakang yang sangat berbeda, dengan kepribadian yang meledak-ledak ketika mereka bentrok. Tapi mereka juga empat anak yang dipilih untuk tim lari sekolah menengah elit—tim yang bisa membuat mereka lolos ke Olimpiade Junior. Mereka semua memiliki banyak kerugian, tetapi mereka semua memiliki banyak hal untuk dibuktikan, tidak hanya untuk satu sama lain, tetapi untuk diri mereka sendiri."),
            Book(title: "Nightlights", author: "Lorena Alvarez", cover: UIImage(named: "Lumieres"), notOwnedCover: UIImage(named: "Lumieres-notOwned"), genre: ["Comedy", "Drama", "Mystery"], isOwned: false, requiredPoints: 30, bookPages: nil, bookTexts: nil, synopsis: "Setiap malam, lampu kecil muncul dari kegelapan di kamar Sandy. Dia menangkap mereka dan menciptakan makhluk-makhluk indah untuk dimainkan sampai dia tertidur, dan di pagi hari dia menghidupkan mereka kembali dalam gambar-gambar anehnya. Ketika seorang gadis baru yang misterius muncul di sekolah, gambar Sandy diperhatikan untuk pertama kalinya ... tetapi ketertarikan Morfie dengan bakat Sandy segera berubah menjadi sesuatu yang jauh lebih menyeramkan."),
            Book(title: "Alice in Wonderland", author: "Lewis Caroll", cover: UIImage(named: "Alice"), notOwnedCover: UIImage(named: "Alice-notOwned"), genre: ["Fantasy", "Mystery", "Fairy Tale"], isOwned: false, requiredPoints: 60, bookPages: nil, bookTexts: nil, synopsis: "Setelah jatuh ke lubang kelinci, Alice mendapati dirinya jauh dari rumah di dunia Wonderland yang absurd. Meskipun menyenangkan, novel Lewis Carroll tahun 1865 adalah keajaiban murni untuk tua dan muda."),
            Book(title: "Mary Poppins", author: "P. L. Travers", cover: UIImage(named: "MaryPoppins"), notOwnedCover: UIImage(named: "MaryPoppins-notOwned"), genre: ["Fantasy", "Adventure"], isOwned: false, requiredPoints: 50, bookPages: nil, bookTexts: nil, synopsis: "SSemuanya dimulai ketika Mary Poppins ditiup angin timur ke depan pintu rumah Banks. Dia menjadi pengasuh yang paling tidak biasa bagi Jane, Michael, dan si kembar. Siapa lagi selain Mary Poppins yang bisa menggeser pegangan tangga, menarik seluruh kursi berlengan dari tas karpet kosong, dan membuat dosis obat terasa seperti jus jeruk manis yang lezat? Sehari bersama Mary Poppins adalah hari keajaiban dan khayalan menjadi hidup!")
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
    Genre(name: "Fable", image: UIImage(named: "Dummy5")),
    Genre(name: "Mystery", image: UIImage(named: "Dummy6")),
    Genre(name: "Adventure", image: UIImage(named: "Dummy3")),
    
]

//User's coin
var userCoin = 0
