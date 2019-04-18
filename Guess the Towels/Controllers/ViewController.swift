//
//  ViewController.swift
//  Guess the Towels
//
//  Created by Boy Havelaar on 14/04/2019.
//  Copyright © 2019 Boy Havelaar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var towelView: UIImageView!
    @IBOutlet weak var continentLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    
    //List of the questions asked
    let allTowels = TowelList()
    
    //Variable properties
    var towelNumber:Int = 0
    var score:Int = 0
    var selectedAnswer:String = ""
    static var continent:String = "Europe"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set a flag and starting score on viewloaded.
        updateTowel()
        updateUI()
        }
    
    //Action for when answer clicked.
    @IBAction func answerClicked(_ sender: UIButton) {
        if sender.accessibilityLabel == selectedAnswer {
            score += 1
            //If the correct answer is chosen, add a point
        }
        //Go to the next flag
        towelNumber += 1
        updateTowel()
        //Trigged function which sets a new flag (towel) to guess with its answers.
    }
    
    func updateTowel(){
        if towelNumber <= allTowels.list.count - 1
        {
            if towelNumber < allTowels.list.count - 1 {
            let url:URL = URL(string: "https://restcountries.eu/rest/v2/name/" + allTowels.list[towelNumber+1].towel)!
            //Set a continent from the api url based on which nation the flag is from.
            setContinent(from: url)
            }
            towelView.image = UIImage(named: allTowels.list[towelNumber].towel)
            buttonA.setTitle(allTowels.list[towelNumber].buttonA, for: UIControl.State.normal)
            buttonB.setTitle(allTowels.list[towelNumber].buttonB, for: UIControl.State.normal)
            buttonC.setTitle(allTowels.list[towelNumber].buttonC, for: UIControl.State.normal)
            selectedAnswer = allTowels.list[towelNumber].correctAnswer
            // Also set 3 new choice options, and set which one is correct and will give a point.
        }
        else
        {
            let alert = UIAlertController(title: "Done!", message: "Quiz finished! Go again?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {action in self.restartQuiz()})
            let scoreAction = UIAlertAction(title: "Scorescreen", style: .default, handler: {action in self.scoreScreen()})
            alert.addAction(restartAction)
            alert.addAction(scoreAction)
            present(alert, animated: true, completion: nil)
            //If we run out of question, prompt the user what to do. Go to the scorescreen, or restart?
        }
        updateUI()
    }
    
    //Updates the UI
    func updateUI(){
        continentLabel.text = "This country is located in \(ViewController.continent)"
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(towelNumber + 1)/\(allTowels.list.count)"
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(allTowels.list.count)) * CGFloat(towelNumber + 1)
    }
    
    //Restarts the quiz
    func restartQuiz(){
        score = 0
        towelNumber = 0
        updateTowel()
    }
    
    //Go to the view to save or view scores
    func scoreScreen() {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreViewController") as! ScoreViewController
        next.self.score = score
        self.present(next, animated: true, completion: nil)
    }
    
    
    }
    
    
    


