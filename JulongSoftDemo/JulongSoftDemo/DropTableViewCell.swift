//
//  DropTableViewCell.swift
//  JulongSoftDemo
//
//  Created by Aravind Durgam on 21/01/19.
//  Copyright © 2019 Aravind. All rights reserved.
//

import UIKit

class DropTableViewCell: UITableViewCell {

    @IBOutlet var bgView: UIView!
    @IBOutlet var titleLBL: UILabel!
    @IBOutlet var sizeLBL: UILabel!
    @IBOutlet var priceLBL: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCellWith1(data:VarientsModel){
        DispatchQueue.main.async {
        }
        self.titleLBL.text = "\("Color: " + "\(String(describing: data.productCOLOR!))")"
        self.priceLBL.text = "\("Price: " + "\(String(describing: data.productPrice!))")"
        self.sizeLBL.text = "\("Size: " + "\(String(describing: data.productSize!))")"
            
  
    }

}
