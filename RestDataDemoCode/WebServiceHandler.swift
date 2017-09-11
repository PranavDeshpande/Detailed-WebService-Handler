//
//  WebServiceHandler.swift
//  RestDataDemoCode
//
//  Created by AM Esfar-E-Alam on 7/6/17.
//  Copyright © 2017 AM Esfar-E-Alam. All rights reserved.
//

import UIKit

let urlString = "http://microblogging.wingnity.com/JSONParsingTutorial/jsonActors"

typealias completionHandler = (Any) -> ()
class WebServiceHandler: NSObject {
    static let sharedInstance = WebServiceHandler()
    
    func getActorArray(completion:@escaping completionHandler) {
        let urlRequest = URL(string: urlString)
        
        URLSession.shared.dataTask(with: urlRequest!) { (data, response, error) in
            
            if error == nil{
                do{
                    if let jsonResult =  try JSONSerialization.jsonObject(with: data!, options:[]) as? Dictionary<String, Any>{
                        
                        guard let arr = jsonResult["actors"] as? [[String:Any]] else{
                            return
                        }
                        var arrayActor:Array<Actor> = []
                        for item in arr{
                            
                            let actor = Actor(name: item["name"] as! String, descripton: item["description"] as! String, dob: item["dob"] as! String, country: item["country"] as! String, height: item["height"] as! String, spouse: item["spouse"] as! String, children: item["children"] as! String, imageUrl: item["image"] as! String)
                            arrayActor.append(actor)
                        }
                        completion(arrayActor)
                    }
                }catch{
                    print(error)
                }
                
            }
            
            }.resume()
        
        
    }

}
