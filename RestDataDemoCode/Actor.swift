//
//  Actor.swift
//  RestDataDemoCode
//
//  Created by AM Esfar-E-Alam on 7/6/17.
//  Copyright © 2017 AM Esfar-E-Alam. All rights reserved.
//

import UIKit

class Actor: NSObject {
    
    var name:String?
    var descripton:String?
    var dob:String?
    var country:String?
    var height:String?
    var spouse:String?
    var children:String?
    var imageUrl:String?



    init(name:String,descripton:String,dob:String,country:String,height:String,spouse:String,children:String,imageUrl:String) {
        
        self.name = name
        self.descripton = descripton
        self.dob = dob
        self.country = country
        self.height = height
        self.spouse = spouse
        self.children = children
        self.imageUrl = imageUrl
        
    }
    

}
