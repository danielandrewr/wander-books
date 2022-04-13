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
            Book(title: "The Tortoise and the Hare", author: "Aesop", cover: UIImage(named: "TortoiseHare"), notOwnedCover: UIImage(named: "TortoiseHare-notOwned"), genre: ["Fable", "Fantasy", "Comedy"], isOwned: true, requiredPoints: 10, bookPages: nil, bookTexts: ["Pada suatu ketika, hiduplah seekor kelinci. Si kelinci menghabiskan sepanjang hari membual ke hewan lain mengenai kemampuan berlalrinya. “Lihatlah seberapa cepat aku bisa berlari!", "Si kelinci berlalri melintasi lapangan secepat mungkin. Semua hewan setuju bahwa si kelinci sangat cepat.", "Kemudian, si kelinci melihat seekor kura-kura dari kejauhan. Si kelinci menertawai si kura-kura dan berkata, “Aku adalah pelari tercepat di hutan ini dan kamu adalah yang paling lambat! Kita harus melakukan lomba lari!”.  Si kura-kura yang sudah lelah dengan kesombongan kelinci pun menyetujui hal tersebut.", "Keesokan harinya, semua hewan di hutan berkumpul untuk menyaksikan kompetisi tersebut. Semuanya ingin melihat apakah si kura-kura bisa mengalahkan kelinci.", "Si beruang memulai lomba dengan berteriak, “Bersiap… dan mulai!” ", "Si kelinci langsung berlari sekencang mungkin, jauh mendahului kura-kura. Kelinci terus berlari sampai kura-kura tidak lagi terlihat sampai ujung mata memandang. “Tidak usah buru-buru!” teriak kelinci kepada kura-kura. “Aku bisa saja menikmati makanan sekarang dan akan tetap menang!”", "Puas dengan hasilnya, kelinci sombong itu mengambil waktunya untuk beristirahat di sebelah pohon. Keteduhan pohon yang sejuk sangat menenangkan si kelinci sehingga ia tertidur pulas.", "Sementara itu, si kura-kura terus berjalan perlahan melintasi lapangan. Akhirnya, kura-kura melihat kelinci yang sedang tertidur pulas di bawah pohon dan berjalan melewatinya.  ", "Para hewan yang menonton pertandingan ini menjadi semakin semangat. “Ayo, kura-kura!” teriak hewan-hewan lain. “Sedikit lagi. Maju terus, kawan!”", "Mendengar suara teriakan dari kejauhan, kelinci pun terbangun. Ia melihat ke seberang lapangan dan tampak si kura-kura sudah akan mencapai garis akhir. Dengan cepat, kelinci langsung berlari untuk mengejar.", "Tetapi, kelinci sudah terlambat. Si kura-kura telah memenangkan pertandingan. “Kamu tidak selalu harus menjadi yang tercepat untuk menang,” ucap kura-kura kepada kelinci, yang sedang menangis tersedu-sedu."], synopsis: "Di suatu hutan yang dipenuhi dengan kehidupan para hewan, hiduplah seekor kelinci angkuh yang suka merendahkan hewan lain yang lebih lambat daripadanya. Suatu ketika, kelinci menemui seekor kura-kura dan mengajaknya untuk berlomba lari..."),
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
struct Question {
    let text: String
    let questionImage: UIImage?
    let answers: [Answer]
}

struct Answer{
    let text: String
    let correct: Bool
}
