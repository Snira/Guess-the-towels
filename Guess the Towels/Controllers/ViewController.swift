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
        updateUI()
        }
    
    @IBAction func answerClicked(_ sender: UIButton) {
        if sender.accessibilityLabel == selectedAnswer {
            print("correct!")
            score += 1
        }else{
            print("incorrect!")
        }
        towelNumber += 1
        updateTowel()
    }
    
    func updateTowel(){
        if towelNumber <= allTowels.list.count - 1
        {
            let url:URL = URL(string: "https://restcountries.eu/data/" + allTowels.list[towelNumber].towel)!
            downloadImage(from: url)
            buttonA.setTitle(allTowels.list[towelNumber].buttonA, for: UIControl.State.normal)
            buttonB.setTitle(allTowels.list[towelNumber].buttonB, for: UIControl.State.normal)
            buttonC.setTitle(allTowels.list[towelNumber].buttonC, for: UIControl.State.normal)
            selectedAnswer = allTowels.list[towelNumber].correctAnswer
        }
        else
        {
            let alert = UIAlertController(title: "Done!", message: "Quiz finished! Go again?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {action in self.restartQuiz()})
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        updateUI()
    }
    
    func updateUI(){
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(towelNumber + 1)/\(allTowels.list.count)"
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(allTowels.list.count)) * CGFloat(towelNumber + 1)
    }
    
    func restartQuiz(){
        score = 0
        towelNumber = 0
        updateTowel()
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                self.towelView.image = UIImage(data: data)
            }
        }
    }
    
    
    
 }

