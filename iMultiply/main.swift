//
//  main.swift
//  iMultiply
//
//  Created by Massimiliano Bartolini on 2022/12/06.
//

import Foundation

class iMultiply {
    var questionNumber = 1
    var score = 0
    var answerFunction = { readLine() }
    
    func start() {
        print("Welcome to iMultiply!")
        
        repeat {
            let question = Question()
            
            print("\n\(questionNumber). \(question.string)")
            print("Your answer: ", terminator: "")
            
            if let answer = answerFunction() {
                let response = process(answer, for: question)
                print(response)
            }
        } while questionNumber <= 10
        
        print("\nYou scored \(score).")
    }
    
    func process(_ answer: String, for question: Question) -> String {
        guard let answerInt = Int(answer) else {
            return ("Error.")
        }
        questionNumber += 1
        if answerInt == question.answer {
            score += 1
            return ("Correct!")
        } else {
            return ("Wrong, result was \(question.answer)")
        }
    }
}
let game = iMultiply()
game.start()


