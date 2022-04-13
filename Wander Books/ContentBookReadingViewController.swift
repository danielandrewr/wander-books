//
//  ContentBookReadingViewController.swift
//  KidReadingApp
//
//  Created by Daniel Roong on 12/04/22.
//

import UIKit
import AVFoundation
import AVKit

class ContentBookReadingViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var illustrationView: UIView!
    
    @IBOutlet weak var IllustrationImage: UIImageView!
    
    @IBOutlet weak var CaptionTextView: UITextView!
    
    @IBOutlet weak var pageInfo: UILabel!
    
    private var bookContent = [Book]()
    
    private var currentPage: Int = 0
    private var currentIndex: Int = 0
    
    private var player: AVPlayer!
    private var playerLayer: AVPlayerLayer!
    
    private var videoArray: [String] = ["Panel 1", "Panel 2", "Panel 4", "Panel 7", "Panel 8", "Panel 9"]
    
    var selectedBook: Book = Book(title: "", author: "", genre: [], isOwned: false, requiredPoints: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        IllustrationImage.image = bookContent[0].bookPages?[currentIndex] ?? UIImage(named: "Dummy1.jpg")
        IllustrationImage.isHidden = true
        CaptionTextView.text = selectedBook.bookTexts?[currentIndex] ?? "Failed to Load Data"
        
        CaptionTextView.font = UIFont(descriptor: UIFontDescriptor.preferredFontDescriptor(withTextStyle: .body).withDesign(.serif)!, size: 17)
        CaptionTextView.selectedTextRange = nil
        
        pageInfo.font = UIFont(descriptor: UIFontDescriptor.preferredFontDescriptor(withTextStyle: .body).withDesign(.serif)!, size: 15)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(onSwipeLeftEvent))
        swipeLeft.delegate = self
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(onSwipeRightEvent))
        swipeRight.direction = .right
        swipeRight.delegate = self
        self.view.addGestureRecognizer(swipeRight)
        
        updatePage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @IBAction func onBackButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @objc private func onSwipeLeftEvent() {
        if (currentIndex < (selectedBook.bookTexts!.count - 1)) {
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
        switch currentIndex {
        case 0: //1
            setAVPlayer(stringPath: videoArray[0])
            IllustrationImage.isHidden = true
            illustrationView.isHidden = false
            print(currentIndex)
        case 1: //2
            setAVPlayer(stringPath: videoArray[1])
            IllustrationImage.isHidden = true
            illustrationView.isHidden = false
            print(currentIndex)
        case 2: //3
            IllustrationImage.isHidden = false
            illustrationView.isHidden = true
            IllustrationImage.image = selectedBook.bookPages?[0]
            print(currentIndex)
        case 3: //4
            setAVPlayer(stringPath: videoArray[2])
            IllustrationImage.isHidden = true
            illustrationView.isHidden = false
            print(currentIndex)
        case 4: //5
            IllustrationImage.isHidden = false
            illustrationView.isHidden = true
            IllustrationImage.image = selectedBook.bookPages?[1]
            print(currentIndex)
        case 5: //6
            IllustrationImage.isHidden = false
            illustrationView.isHidden = true
            IllustrationImage.image = selectedBook.bookPages?[2]
            print(currentIndex)
        case 6: //7
            setAVPlayer(stringPath: videoArray[3])
            IllustrationImage.isHidden = true
            illustrationView.isHidden = false
            print(currentIndex)
        case 7: //8
            setAVPlayer(stringPath: videoArray[4])
            IllustrationImage.isHidden = true
            illustrationView.isHidden = false
            print(currentIndex)
        case 8: //9
            setAVPlayer(stringPath: videoArray[5])
            IllustrationImage.isHidden = true
            illustrationView.isHidden = false
            print(currentIndex)
        case 9:
            IllustrationImage.isHidden = false
            illustrationView.isHidden = true
            IllustrationImage.image = selectedBook.bookPages?[3]
            print(currentIndex)
        case 10:
            IllustrationImage.isHidden = false
            illustrationView.isHidden = true
            IllustrationImage.image = selectedBook.bookPages?[4]
            print(currentIndex)
        default:
            IllustrationImage.isHidden = true
            illustrationView.isHidden = false
            setAVPlayer(stringPath: videoArray[0])
        }
        //IllustrationImage.image = bookContent[0].bookPages?[currentIndex]
        CaptionTextView.text = selectedBook.bookTexts?[currentIndex]
        pageInfo.text = "\(currentIndex+1)/\(getTotalPages())"
    }
    
    private func setAVPlayer(stringPath: String) {
        player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: stringPath, ofType: "mp4")!))
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player.currentItem)
        
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.bounds = illustrationView.bounds
        illustrationView.layer.addSublayer(playerLayer)
        player.play()
    }
    
    private func getTotalPages() -> Int {
        return selectedBook.bookTexts?.count ?? 0
    }
    
    @objc private func playerDidReachEnd() {
        self.player.seek(to: CMTime.zero)
        self.player.play()
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
