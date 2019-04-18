//
//  ViewController.swift
//  Guess the Towels
//
//  Created by Boy Havelaar on 14/04/2019.
//  Copyright © 2019 Boy Havelaar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var towelView: UIImageView!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    
    let allTowels = TowelList()
    var towelNumber:Int = 0
    var score:Int = 0
    var selectedAnswer:String = ""
    
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        updateTowel()
        }
    
    @IBAction func answerClicked(_ sender: UIButton) {
        if sender.accessibilityLabel == selectedAnswer {
            print("correct!")
            score += 1
        }else{
            print("incorrect!")
        }
        updateTowel()
    }
    
    func updateTowel(){
        towelView.image = UIImage(named:(allTowels.list[towelNumber].towel))
        buttonA.setTitle(allTowels.list[towelNumber].buttonA, for: UIControl.State.normal)
        buttonB.setTitle(allTowels.list[towelNumber].buttonB, for: UIControl.State.normal)
        buttonC.setTitle(allTowels.list[towelNumber].buttonC, for: UIControl.State.normal)
        selectedAnswer = allTowels.list[towelNumber].correctAnswer
        
        if towelNumber < allTowels.list.count{
            towelNumber += 1
        }else{
            let alert = UIAlertController(title: "Done!", message: "Quiz finished! Go again?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {action in self.restartQuiz()})
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func updateUI(){
        
    }
    
    func restartQuiz(){
        
    }
    
 }

