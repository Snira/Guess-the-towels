//
//  getContinent.swift
//  Guess the Towels
//
//  Created by Boy Havelaar on 18/04/2019.
//  Copyright © 2019 Boy Havelaar. All rights reserved.
//

import Foundation

//Class which handles getting API data and setting continent
class setContinent{
    //Datatask
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    //The continent of the next flag is set using an API.
    //By giving the name of the flag, the Restful Flag API returns various parameters
    //In this app we get the region (continent) of the nation, to show as a hint
   init(from url: URL) {
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
                ViewController.self.continent = jsonArray[0]["region"] as! String
            } catch let parsingError {
                print("Parsing error!", parsingError)
            }
        }
    }
}
