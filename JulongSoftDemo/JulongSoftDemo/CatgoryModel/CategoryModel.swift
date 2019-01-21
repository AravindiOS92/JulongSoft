//
//  CategoryModel.swift
//  JulongSoftDemo
//
//  Created by Aravind Durgam on 20/01/19.
//  Copyright © 2019 Aravind. All rights reserved.
//

import Foundation
import SwiftyJSON

class CategoryModel: NSObject {
    
    var similarDetails = [ArrayDataModel]()
    

override init() {
    super.init()
}

init(eventDetails: NSDictionary) {
    super.init()
    
    let json0 = JSON(eventDetails)

    
    let similarEventsArray = json0["categories"].arrayObject
    

    
    if similarEventsArray != nil
    {
        for similarItems in similarEventsArray! {
            let modelUpcoming = ArrayDataModel(similar: similarItems as! NSDictionary)
            similarDetails += [modelUpcoming]
        }
    }else
    {
        
    }
    
    
   
    
    
    

    
    
    
    
}

}
