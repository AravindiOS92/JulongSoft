//
//  ArrayDataModel.swift
//  JulongSoftDemo
//
//  Created by Aravind Durgam on 20/01/19.
//  Copyright © 2019 Aravind. All rights reserved.
//

import Foundation
import SwiftyJSON

class ArrayDataModel: NSObject {
    var eventName: String?
    var collectionDetails = [ProductionModel]()
    
    override init() {
        super.init()
    }
    init(similar: NSDictionary) {
        super.init()
        let json0 = JSON(similar)
        let upcomingEventsArray = json0["products"].arrayObject
        
        if let eventName = similar["name"] as? String
        {
            self.eventName = eventName
        }

        
        if upcomingEventsArray != nil
        {
            for similarItems in upcomingEventsArray! {
                let modelUpcoming = ProductionModel(similar: similarItems as! NSDictionary)
                collectionDetails += [modelUpcoming]
            }
        }else
        {
            
        }
        
    }

}
