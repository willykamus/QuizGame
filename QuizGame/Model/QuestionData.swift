//
//  QuestionData.swift
//  QuizGame
//
//  Created by William Ching on 2019-04-02.
//  Copyright © 2019 William Ching. All rights reserved.
//

import Foundation

class QuestionData {
    
    // Create the array with questions
    var questionList = [Question]()
    
    init() {
        
        //Create a question
        //The text
        var str = "Who is the greatest tennis player in history?"
        //Create the answers
        //Create an array of answers
        var answerList = [Answer]()
        //Create possible answers
        var possibleans1 = Answer(text: "Rafael Nadal")
        var possibleans2 = Answer(text: "Roger Federer")
        var possibleans3 = Answer(text: "Novak Djokovic")
        var possibleans4 = Answer(text: "Bjorn Borg")
        
        //Add possible answers to array of answers
        answerList.append(possibleans1)
        answerList.append(possibleans2)
        answerList.append(possibleans3)
        answerList.append(possibleans4)
        
        var newQuestion = Question()
        newQuestion.text = str
        newQuestion.correctAnswer = possibleans2
        newQuestion.possibleAnswers = answerList
        
        questionList.append(newQuestion)
        
        
        
    }
    
    
    
    
    
    
    
    

    
    
    
}
