//
//  QuizViewController.swift
//  KidReadingApp
//
//  Created by Vincensa Regina on 08/04/22.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var questionCoverImage: UIImageView!
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var choiceButton1: UIButton!
    @IBOutlet weak var choiceButton2: UIButton!
    @IBOutlet weak var choiceButton3: UIButton!
    @IBOutlet weak var choiceButton4: UIButton!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBarView: UIProgressView!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var userCoinLabel: UILabel!
    
    //Data
    var gameModels = [Question]()
    var currentQuestion: Question?
    var point: Int = 0
    var selectedBook: Book = Book(title: "", author: "", genre: [], isOwned: false, requiredPoints: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        questionCoverImage.image = UIImage(named: "Dummy1")
        setupQuestions()
        configureUI(question: gameModels.first!)
        userCoinLabel.text = "\(userCoin)"
    }
    
    
    //functions
    
    @IBAction func closeQuiz(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func buttonSelection (_ sender: UIButton){
        deselectAllButtons()
        sender.isSelected = true
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        guard let question = currentQuestion else{
            return
        }
        let index = buttons.firstIndex(where: {$0.isSelected == true}) ?? 0
        let answer = question.answers[index]

        //if answer is correct, gain 1 point
        if checkAnswer(answer: answer, question: question){
            point = point + 1
        }
        
        deselectAllButtons()
        //find the index
        if let index = gameModels.firstIndex(where: {$0.text == currentQuestion?.text}){
            if index < (gameModels.count-1){
                //continue to next question
                let nextQuestion = gameModels[index+1]
                configureUI(question: nextQuestion)
            } else {
                //if get to the last question, end quiz
                userCoin += point
                showFeedback()
                
            }
        }
    }
    
    
    
    private func showFeedback(){
        let alert = UIAlertController(title:"Done!", message: "Woohoo! You got \(point) points!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {action in self.segueBacktoBookInfo()}))
        present(alert, animated: true)
    }
    
    private func segueBacktoBookInfo(){
        let mainPage = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = mainPage.instantiateViewController(withIdentifier: "Main")
        mainViewController.modalPresentationStyle = .fullScreen
        present(mainViewController, animated: true)
    }
    
    private func deselectAllButtons(){
        for buttonElement in buttons {
            if let button = buttonElement as UIButton?{
                button.isSelected = false
            }
        }
    }
    
    private func configureUI(question: Question){
        //create the questions and choices
        currentQuestion = question
        
        //generate UI
        questionTextView.text = question.text
        questionCoverImage.image = question.questionImage
        
        
        let currIndex = gameModels.firstIndex(where: {$0.text == currentQuestion?.text}) ?? 0
        progressLabel.text = "\(currIndex+1) / \(gameModels.count)"
        progressBarView.setProgress((Float(currIndex+1)/Float(gameModels.count)), animated: true)
        
        for button in buttons {
            let index = buttons.firstIndex(of: button) ?? 0
            button.setTitle(question.answers[index].text, for: .normal)
        }
    }
    
    private func checkAnswer(answer: Answer, question: Question) -> Bool{
        return question.answers.contains(where: {$0.text == answer.text}) && answer.correct
    }
    
    private func setupQuestions(){
        gameModels.append(Question(text: "Siapa yang sering menyombongkan kemampuan berlarinya?", questionImage: UIImage(named: "Panel 3"), answers: [
                Answer(text: "tupai", correct: false),
                Answer(text: "rubah", correct: false),
                Answer(text: "kelinci", correct: true),
                Answer(text: "beruang", correct: false)
        ]))
        gameModels.append(Question(text: "Siapa yang memulaikan lomba lari antara kelinci dan kura-kura?", questionImage: UIImage(named: "Panel 5"), answers: [
                Answer(text: "rubah", correct: false),
                Answer(text: "beruang", correct: true),
                Answer(text: "kura-kura", correct: false),
                Answer(text: "kelinci", correct: false)
        ]))
        gameModels.append(Question(text: "Dimanakah kelinci beristirahat di tengah lomba lari?", questionImage: UIImage(named: "Panel 10"), answers: [
                Answer(text: "di rumah", correct: false),
                Answer(text: "di padang bunga", correct: false),
                Answer(text: "di tepi danau", correct: false),
                Answer(text: "di bawah pohon", correct: true)
        ]))
    }

}
