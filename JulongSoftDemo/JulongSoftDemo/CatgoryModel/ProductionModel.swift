//
//  ProductionModel.swift
//  JulongSoftDemo
//
//  Created by Aravind Durgam on 20/01/19.
//  Copyright © 2019 Aravind. All rights reserved.
//

import Foundation
import SwiftyJSON

class ProductionModel: NSObject {
    var eventName: String!
    var varientDetails = [VarientsModel]()
    
    override init() {
        super.init()
    }
    init(similar: NSDictionary) {
        super.init()
        let json0 = JSON(similar)
        let varientsEventsArray = json0["variants"].arrayObject
        
        if let eventName = similar["name"] as? String
        {
            self.eventName = eventName
        }
        
        if varientsEventsArray != nil
        {
            for similarItems in varientsEventsArray! {
                let modelUpcoming = VarientsModel(similar: similarItems as! NSDictionary)
                varientDetails += [modelUpcoming]
            }
        }else
        {
            
        }
        

        
    }
    
}
