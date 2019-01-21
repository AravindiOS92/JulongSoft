//
//  CustomCollectionViewCell.swift
//  JulongSoftDemo
//
//  Created by Aravind Durgam on 20/01/19.
//  Copyright © 2019 Aravind. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet var bgView: UIView!
    @IBOutlet var titltLBL: UILabel!
    
    
    func configureCellWith(data:ArrayDataModel){
        DispatchQueue.main.async {
        }
        bgView.layer.shadowColor = UIColor.black.cgColor
                bgView.layer.shadowOpacity = 0.99
                bgView.layer.shadowOffset = CGSize.zero
                bgView.layer.shadowRadius = 8.0
        
        titltLBL.text = data.eventName
 
}

}
