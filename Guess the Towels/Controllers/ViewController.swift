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
    
    
    let allTowels = TowelList()
    var towelNumber:Int = 0
    var score:Int = 0
    var selectedAnswer:String = ""
    var continent:String = ""
    
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        updateTowel()
        
        //Set a flag and starting score on viewloaded.
        }
    
    @IBAction func answerClicked(_ sender: UIButton) {
        if sender.accessibilityLabel == selectedAnswer {
            score += 1
            //If the correct answer is chosen, add a point
        }
        towelNumber += 1
        updateTowel()
        //Trigged function which sets a new flag (towel) to guess with its answers.
    }
    
    func updateTowel(){
        if towelNumber <= allTowels.list.count - 1
        {
            let url:URL = URL(string: "https://restcountries.eu/rest/v2/name/" + allTowels.list[towelNumber].towel)!
            //Set a continent from the api url based on which nation the flag is from.
            setContinent(from: url)
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
    
    func updateUI(){
        continentLabel.text = "This country is located in \(self.continent)"
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(towelNumber + 1)/\(allTowels.list.count)"
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(allTowels.list.count)) * CGFloat(towelNumber + 1)
    }
    
    func restartQuiz(){
        score = 0
        towelNumber = 0
        updateTowel()
    }
    
    func scoreScreen() {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreViewController") as! ScoreViewController
        next.self.score = score
        self.present(next, animated: true, completion: nil)
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func setContinent(from url: URL) {
        getData(from: url) { data, response, error in
            guard let dataResponse = data,
                error == nil else {
                    return }
            do{
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    return
                }
                //set continent for current flag
                self.continent = jsonArray[0]["region"] as! String
            } catch let parsingError {
                print("Parsing error!", parsingError)
            }
        }
        }
    }
    
    
    


