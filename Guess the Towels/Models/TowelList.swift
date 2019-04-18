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
        list.append(Towel(image: "nld.svg", continent: "europe", a: "France", b: "Netherlands", c: "India", answer: "b"))
        list.append(Towel(image: "ita.svg", continent: "europe", a: "Egypt", b: "Hungary", c: "Italy", answer: "c"))
        list.append(Towel(image: "due.svg", continent: "europe", a: "Germany", b: "Belgium", c: "Ukraine", answer: "a"))
        list.append(Towel(image: "jpn.svg", continent: "asia", a: "China", b: "Thailand", c: "Japan", answer: "c"))
        list.append(Towel(image: "chn.svg", continent: "asia", a: "China", b: "Thailand", c: "Japan", answer: "a"))
        }
}
