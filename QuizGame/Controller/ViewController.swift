//
//  ViewController.swift
//  QuizGame
//
//  Created by William Ching on 2019-04-02.
//  Copyright © 2019 William Ching. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionData()
    var currentQuestion:Question = Question()
    var counter = 0
    

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var userOptions: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        currentQuestion = allQuestions.questionList[counter]
        questionLabel.text = currentQuestion.text
        setPossibleAnswers()
        
    }

    @IBAction func optionPressed(_ sender: UIButton) {
        
        let userAnswer = sender.titleLabel?.text
        
        if checkUserAnswer(userAnswer: userAnswer!) {
            
            createAlert(title: "Awesome!", message: "You got it right!")
            
        } else {
            createAlert(title: "Ohhhh!", message: "Wrong answer!")
        }
        
    }
    
    
    func createAlert(title:String, message:String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert,animated: true,completion: nil)
    }
    
    func setPossibleAnswers(){
        
        for i in 0..<currentQuestion.possibleAnswers.count {
            
            var possibleAnswer = currentQuestion.possibleAnswers[i].text
            userOptions[i].titleLabel?.numberOfLines = 2
            userOptions[i].setTitle(possibleAnswer, for: .normal)
            userOptions[i].sizeToFit()
            
        }
        
    }
    
    func checkUserAnswer(userAnswer:String) -> Bool {
        
        if userAnswer == currentQuestion.correctAnswer.text {
            return true
        } else {
            return false
        }
        
    }
    
}

