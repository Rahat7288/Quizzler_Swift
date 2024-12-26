//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    label text ========
    @IBOutlet weak var questionLabel: UILabel!
//    progress bar =======
    @IBOutlet weak var progressBar: UIProgressView!
//    ui buttons=============
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    
    
    var quizBrain = QuizBrain()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        quizBrain.checkAnswer(userAnswer)
        
        if userAnswer == actualAnswer{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        }else{
            questionNumber = 0
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUi), userInfo: nil, repeats: false)
       
   
        
   
    }
    
   @objc func updateUi(){
        questionLabel.text = quiz[questionNumber].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
       progressBar.progress = Float(questionNumber + 1) / Float(quiz.count)
    }
}

