//
//  TableViewCell.swift
//  JulongSoftDemo
//
//  Created by Aravind Durgam on 20/01/19.
//  Copyright © 2019 Aravind. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var titleLBL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCellWith1(data:ProductionModel){
        DispatchQueue.main.async {
            
            self.titleLBL.text = data.eventName
            
        }
    }
    
    
}
