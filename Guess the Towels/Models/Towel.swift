//
//  Towel.swift
//  Guess the Towels
//
//  Created by Boy Havelaar on 14/04/2019.
//  Copyright © 2019 Boy Havelaar. All rights reserved.
//

import Foundation
import UIKit

class Towel {
    let towel:String
    let region:String
    let buttonA:String
    let buttonB:String
    let buttonC:String
    let correctAnswer:String
 
    init(image: String, continent:String, a: String, b:String, c: String, answer: String) {
        towel = image
        region = continent
        buttonA = a
        buttonB = b
        buttonC = c
        correctAnswer = answer
        
    }
}


    






