//
//  TowelList.swift
//  Guess the Towels
//
//  Created by Boy Havelaar on 18/04/2019.
//  Copyright © 2019 Boy Havelaar. All rights reserved.
//

import Foundation

//"Towel" is a synonym for flag used in this application.
class TowelList{
    //This class returns a list with questions used in the quiz
    var list = [Towel]()
    
    //Set questions in list on init
    init() {
        list.append(Towel(image: "netherlands", a: "France", b: "Netherlands", c: "India", answer: "b"))
        list.append(Towel(image: "italy", a: "Egypt", b: "Hungary", c: "Italy", answer: "c"))
        list.append(Towel(image: "germany", a: "Germany", b: "Belgium", c: "Ukraine", answer: "a"))
        list.append(Towel(image: "japan", a: "China", b: "Thailand", c: "Japan", answer: "c"))
        list.append(Towel(image: "china", a: "China", b: "Thailand", c: "Japan", answer: "a"))
        }
}
