//
//  TowelList.swift
//  Guess the Towels
//
//  Created by Boy Havelaar on 18/04/2019.
//  Copyright © 2019 Boy Havelaar. All rights reserved.
//

import Foundation

class TowelList{
    var list = [Towel]()
    
    init() {
        list.append(Towel(image: "netherlands", continent: "europe", a: "France", b: "Netherlands", c: "India", answer: "b"))
        list.append(Towel(image: "italy", continent: "europe", a: "Egypt", b: "Hungary", c: "Italy", answer: "c"))
        list.append(Towel(image: "germany", continent: "europe", a: "Germany", b: "Belgium", c: "Ukraine", answer: "a"))
        list.append(Towel(image: "japan", continent: "asia", a: "China", b: "Thailand", c: "Japan", answer: "c"))
        list.append(Towel(image: "china", continent: "asia", a: "China", b: "Thailand", c: "Japan", answer: "a"))
        }
}
