//
//  ContentBookReadingViewController.swift
//  KidReadingApp
//
//  Created by Daniel Roong on 12/04/22.
//

import UIKit

class ContentBookReadingViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var IllustrationImage: UIImageView!
    
    @IBOutlet weak var CaptionTextView: UITextView!
    
    @IBOutlet weak var pageInfo: UILabel!
    
    private var bookContent = [Book]()
    
    private var currentPage: Int = 0
    private var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookContent.append(Book(title: "The Tortoise and the Hare", author: "Aesop", cover: UIImage(named: "Dummy1"), notOwnedCover: UIImage(named: "Dummy3"), genre: ["Fable", "Fantasy", "Comedy"], isOwned: false, requiredPoints: 10, bookPages: nil, bookTexts: ["Pada suatu ketika, hiduplah seekor kelinci. Si kelinci menghabiskan sepanjang hari membual ke hewan lain mengenai kemampuan berlalrinya. “Lihatlah seberapa cepat aku bisa berlari!", "Si kelinci berlalri melintasi lapangan secepat mungkin. Semua hewan setuju bahwa si kelinci sangat cepat.", "Kemudian, si kelinci melihat seekor kura-kura dari kejauhan. Si kelinci menertawai si kura-kura dan berkata, “Aku adalah pelari tercepat di hutan ini dan kamu adalah yang paling lambat! Kita harus melakukan lomba lari!”.  Si kura-kura yang sudah lelah dengan kesombongan kelinci pun menyetujui hal tersebut.", "Keesokan harinya, semua hewan di hutan berkumpul untuk menyaksikan kompetisi tersebut. Semuanya ingin melihat apakah si kura-kura bisa mengalahkan kelinci.", "Si beruang memulai lomba dengan berteriak, “Bersiap… dan mulai!” ", "Si kelinci langsung berlari sekencang mungkin, jauh mendahului kura-kura. Kelinci terus berlari sampai kura-kura tidak lagi terlihat sampai ujung mata memandang. “Tidak usah buru-buru!” teriak kelinci kepada kura-kura. “Aku bisa saja menikmati makanan sekarang dan akan tetap menang!”", "Puas dengan hasilnya, kelinci sombong itu mengambil waktunya untuk beristirahat di sebelah pohon. Keteduhan pohon yang sejuk sangat menenangkan si kelinci sehingga ia tertidur pulas.", "Sementara itu, si kura-kura terus berjalan perlahan melintasi lapangan. Akhirnya, kura-kura melihat kelinci yang sedang tertidur pulas di bawah pohon dan berjalan melewatinya.  ", "Para hewan yang menonton pertandingan ini menjadi semakin semangat. “Ayo, kura-kura!” teriak hewan-hewan lain. “Sedikit lagi. Maju terus, kawan!”", "Mendengar suara teriakan dari kejauhan, kelinci pun terbangun. Ia melihat ke seberang lapangan dan tampak si kura-kura sudah akan mencapai garis akhir. Dengan cepat, kelinci langsung berlari untuk mengejar.", "Tetapi, kelinci sudah terlambat. Si kura-kura telah memenangkan pertandingan. “Kamu tidak selalu harus menjadi yang tercepat untuk menang,” ucap kura-kura kepada kelinci, yang sedang menangis tersedu-sedu."]))

        IllustrationImage.image = bookContent[0].bookPages?[currentIndex] ?? UIImage(named: "Dummy1.jpg")
        CaptionTextView.text = bookContent[0].bookTexts?[currentIndex] ?? "Failed to Load Data"
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(onSwipeLeftEvent))
        swipeLeft.delegate = self
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(onSwipeRightEvent))
        swipeRight.direction = .right
        swipeRight.delegate = self
        self.view.addGestureRecognizer(swipeRight)
        
        CaptionTextView.font = UIFont(descriptor: UIFontDescriptor.preferredFontDescriptor(withTextStyle: .body).withDesign(.serif)!, size: 17)
        CaptionTextView.selectedTextRange = nil
        
        pageInfo.font = UIFont(descriptor: UIFontDescriptor.preferredFontDescriptor(withTextStyle: .body).withDesign(.serif)!, size: 15)
        updatePage()
    }
    
    @IBAction func onBackButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @objc private func onSwipeLeftEvent() {
        if (currentIndex < (bookContent[0].bookTexts!.count - 1)) {
            currentIndex += 1
            updatePage()
        }
    }
    
    @objc private func onSwipeRightEvent() {
        if (currentIndex > 0) {
            currentIndex -= 1
            updatePage()
        }
    }
    
    private func updatePage() {
        IllustrationImage.image = bookContent[0].bookPages?[currentIndex]
        CaptionTextView.text = bookContent[0].bookTexts?[currentIndex]
        pageInfo.text = "\(currentIndex+1)/\(getTotalPages())"
    }
    
    private func getTotalPages() -> Int {
        return bookContent[0].bookTexts?.count ?? 0
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
