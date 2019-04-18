//
//  Towel.swift
//  Guess the Towels
//
//  Created by Boy Havelaar on 14/04/2019.
//  Copyright © 2019 Boy Havelaar. All rights reserved.
//

import Foundation
import UIKit

//"Towel" is a synonym for flag used in this application.
class Towel {
    let towel:String
    let buttonA:String
    let buttonB:String
    let buttonC:String
    let correctAnswer:String
 
    init(image: String, a: String, b:String, c: String, answer: String) {
        towel = image
        buttonA = a
        buttonB = b
        buttonC = c
        correctAnswer = answer
    }
}


    






