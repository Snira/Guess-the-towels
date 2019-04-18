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
        let defaults = UserDefaults.standard
        print(score)
        //Set
        defaults.set(score, forKey: "Score")
        //Get
    }
    
    
    
}
