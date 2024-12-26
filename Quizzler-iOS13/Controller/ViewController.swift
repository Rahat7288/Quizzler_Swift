//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    user score label text==========
    @IBOutlet weak var userScore: UILabel!
//   question label text ========
    
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
//        sending user asser using answer buttons ===========
        let userAnswer = sender.currentTitle!
//        checking user answeers ==============
        let userGotItRight  = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUi), userInfo: nil, repeats: false)
       
   
        
   
    }
    
   @objc func updateUi(){
       questionLabel.text = quizBrain.getQuestion()
       userScore.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
       progressBar.progress = quizBrain.getProgress()
    }
}

