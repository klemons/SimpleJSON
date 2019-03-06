//
//  DataManager.swift
//  SimpleJSON_KL
//
//  Created by Kyle Lemons on 3/4/19.
//  Copyright © 2019 Kyle Lemons. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
    let MYJSONURL = "https://api.myjson.com/bins/ewokm"
    
    var dataArray = ["No data yet, pally"]

        func getData(completion: @escaping (_ success: Bool) ->())
        {
            var success = true
            let actualUrl = URL(string: MYJSONURL)
            
            let task = URLSession.shared.dataTask(with: actualUrl!){
                (data, response, error) in
                
                if let _ = data, error == nil {
                    
                    if let jsonObj = try?
                        JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary
                    {
                        print(jsonObj!.value(forKey:"characters")!)
                        
                        if let veggieArray = jsonObj!.value(forKey: "characters")as? Array<String>
                        {
                            self.dataArray = veggieArray
                            
                            print(jsonObj!.value (forKey: "characters")!)
                        }
                    }
                } else {
                    success = false
                    }
                completion(success)
        }
         task.resume()
        }
        
    }
