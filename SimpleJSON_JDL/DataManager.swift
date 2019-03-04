//
//  DataManager.swift
//  SimpleJSON_JDL
//
//  Created by Jessica Lowry on 3/4/19.
//  Copyright © 2019 Jessica Lowry. All rights reserved.
//

import UIKit

class DataManager: NSObject {

    func getData()
    {
        let urlString = "https://api.myjson.com/bins/136w0u"
        
        let actualUrl = URL(string: urlString)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: actualUrl!) { (data, response, error) in
            if error != nil
                //handle error
            {
                
            }
            
            if let successfulData = data
            {
                print(String(data: successfulData, encoding: String.Encoding.ascii))
            }
            
            
        }
        task.resume()
        
    }
}
