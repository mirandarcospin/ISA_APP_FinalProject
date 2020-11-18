//
//  DataController.swift
//  ISA_APP_FinalProject
//
//  Created by Miranda Ramirez Cospin on 11/12/20.
//

import UIKit

class DataController: NSObject {

    let JSONURL = "https://api.jsonbin.io/b/5fade6d943fc1e2e1b417a86/6"
    
    var dataModel: InfoData?
    
    func getJSONData(completion: @escaping (_ dataModel: InfoData) -> ()){
        
        let jsonUrl = URL(string: JSONURL)
        
        let dataTask = URLSession.shared.dataTask(with: jsonUrl!) {
            (data, response, error) in
            
            guard let thisData = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let thisMediaData = try decoder.decode(InfoData.self, from: thisData)
                
                self.dataModel = thisMediaData
                
            } catch let err {
                print("Error was: ", err)
            }
            
            // call back the completionHandler and let them know we are done
            
            //go back to the main thread
            DispatchQueue.main.async {
                completion(self.dataModel!)
            }
            
        }
        dataTask.resume()
    }
    
}
