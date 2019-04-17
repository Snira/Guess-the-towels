//
//  GetJSON.swift
//  Guess the Towels
//
//  Created by Boy Havelaar on 15/04/2019.
//  Copyright © 2019 Boy Havelaar. All rights reserved.
//

import Foundation
import UIKit

class GetJSON{
    
func fetchData (){
        let session = URLSession.shared
        let url = URL(string: "https://restcountries.eu/rest/v2/all")!
        let task = session.dataTask(with: url) { data, response, error in
            
            if error != nil || data == nil {
                print("Client error!")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Couldn't connect to the server")
                return
            }
            
            guard let mime = response.mimeType, mime == "application/json" else {
                print("Json data expected but not given")
                return
            }
            
            do {
                let parsedData = try JSONSerialization.jsonObject(with: data!) as! [[String : Any]]
                for item in parsedData
                {
                    
                    print((item))
                    
                    
                }
            } catch {
                print("JS§ON error: \(error.localizedDescription)")
            }
       
    }
        task.resume()
}
}
