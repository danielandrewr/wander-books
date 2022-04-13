//
//  BookReadingViewController.swift
//  KidReadingApp
//
//  Created by Vincensa Regina on 08/04/22.
//
import UIKit

class BookReadingViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var coverImageView: UIImageView!
    
    private var bookContent = [Book]()
    
    private var currentPage = 0;
    
    var selectedBook: Book = Book(title: "", author: "", genre: [], isOwned: false, requiredPoints: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(selectedBook.title)
        print(selectedBook.bookTexts?[0] ?? "Failed to Load")
        print(selectedBook.isOwned)
        
//        bookContent.append(Book(title: "The Tortoise and the Hare", author: "Aesop", cover: UIImage(named: "Dummy1"), notOwnedCover: UIImage(named: "Dummy3"), genre: ["Fable", "Fantasy", "Comedy"], isOwned: false, requiredPoints: 10, bookPages: nil, bookTexts: ["Pada suatu ketika, hiduplah seekor kelinci. Si kelinci menghabiskan sepanjang hari membual ke hewan lain mengenai kemampuan berlalrinya. “Lihatlah seberapa cepat aku bisa berlari!", "Si kelinci berlalri melintasi lapangan secepat mungkin. Semua hewan setuju bahwa si kelinci sangat cepat.", "Kemudian, si kelinci melihat seekor kura-kura dari kejauhan. Si kelinci menertawai si kura-kura dan berkata, “Aku adalah pelari tercepat di hutan ini dan kamu adalah yang paling lambat! Kita harus melakukan lomba lari!”.  Si kura-kura yang sudah lelah dengan kesombongan kelinci pun menyetujui hal tersebut.", "Keesokan harinya, semua hewan di hutan berkumpul untuk menyaksikan kompetisi tersebut. Semuanya ingin melihat apakah si kura-kura bisa mengalahkan kelinci.", "Si beruang memulai lomba dengan berteriak, “Bersiap… dan mulai!” ", "Si kelinci langsung berlari sekencang mungkin, jauh mendahului kura-kura. Kelinci terus berlari sampai kura-kura tidak lagi terlihat sampai ujung mata memandang. “Tidak usah buru-buru!” teriak kelinci kepada kura-kura. “Aku bisa saja menikmati makanan sekarang dan akan tetap menang!”", "Puas dengan hasilnya, kelinci sombong itu mengambil waktunya untuk beristirahat di sebelah pohon. Keteduhan pohon yang sejuk sangat menenangkan si kelinci sehingga ia tertidur pulas.", "Sementara itu, si kura-kura terus berjalan perlahan melintasi lapangan. Akhirnya, kura-kura melihat kelinci yang sedang tertidur pulas di bawah pohon dan berjalan melewatinya.  ", "Para hewan yang menonton pertandingan ini menjadi semakin semangat. “Ayo, kura-kura!” teriak hewan-hewan lain. “Sedikit lagi. Maju terus, kawan!”", "Mendengar suara teriakan dari kejauhan, kelinci pun terbangun. Ia melihat ke seberang lapangan dan tampak si kura-kura sudah akan mencapai garis akhir. Dengan cepat, kelinci langsung berlari untuk mengejar.", "Tetapi, kelinci sudah terlambat. Si kura-kura telah memenangkan pertandingan. “Kamu tidak selalu harus menjadi yang tercepat untuk menang,” ucap kura-kura kepada kelinci, yang sedang menangis tersedu-sedu."]))
        titleLabel.text = selectedBook.title
        authorLabel.text = selectedBook.author
        coverImageView.image = selectedBook.cover
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(onSwipeLeftEvent))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc private func onSwipeLeftEvent() {
        guard let readerViewControl = storyboard?.instantiateViewController(withIdentifier: "BookReader") else {
            return
        }
        readerViewControl.modalPresentationStyle = .fullScreen
        present(readerViewControl, animated: true, completion: nil)
    }
    
    @IBAction func onBackButtonPressed(_ sender: Any) {
        // performSegue or instantioanStoryboard to BookInformation
    }
}
