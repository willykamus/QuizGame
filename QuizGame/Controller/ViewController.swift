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
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert,animated: true,completion: nil)
    }
    
    func setPossibleAnswers(){
        
        var optionsNums:[Int] = []
        
        for i in 0..<currentQuestion.possibleAnswers.count {
            
            //Generate a random number from 0 to 3
            var num = Int.random(in: 0...3)
            
            while optionsNums.contains(num) {
                
                num = Int.random(in: 0...userOptions.count-1)
                
            }
            
            let possibleAnswer = currentQuestion.possibleAnswers[i].text
            userOptions[num].setTitle(possibleAnswer, for: .normal)
            
            optionsNums.append(num)
            
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

