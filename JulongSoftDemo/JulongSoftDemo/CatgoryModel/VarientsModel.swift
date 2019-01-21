//
//  VarientsModel.swift
//  JulongSoftDemo
//
//  Created by Aravind Durgam on 21/01/19.
//  Copyright © 2019 Aravind. All rights reserved.
//

import Foundation
import SwiftyJSON

class VarientsModel: NSObject {
    var productCOLOR: String!
    var productSize: Int!
    var productPrice: Int!
    
    
    override init() {
        super.init()
    }
    init(similar: NSDictionary) {
        super.init()
        
        if let prctName = similar["color"] as? String
        {
            self.productCOLOR = prctName
        }
        
        if let prdSize = similar["size"] as? Int
        {
            self.productSize = prdSize
        }
        
        if let prdPrice = similar["price"] as? Int
        {
            self.productPrice = prdPrice
        }
        
        
        
        
    }
    
}

