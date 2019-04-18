//
//  ScoreViewController.swift
//  Guess the Towels
//
//  Created by Boy Havelaar on 18/04/2019.
//  Copyright © 2019 Boy Havelaar. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    var score:Int = 0
    
    @IBOutlet weak var finalScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finalScore.text = "Final Score: \(score)"
    }
    
    @IBAction func saveClicked(_ sender: UIButton) {
        //Saves score of this quiz.
        UserDefaults.standard.set(self.score, forKey: "score")
     }
    
    @IBAction func showLastScore(_ sender: UIButton){
        //Prints score of quiz last saved.
        let lastScore = UserDefaults.standard.object(forKey: "score")
        print(lastScore)
    }
    
    
    
}
