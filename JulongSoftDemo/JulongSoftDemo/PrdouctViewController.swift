//
//  PrdouctViewController.swift
//  JulongSoftDemo
//
//  Created by Aravind Durgam on 20/01/19.
//  Copyright © 2019 Aravind. All rights reserved.
//

import UIKit

class PrdouctViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
 

  
    
    @IBOutlet var noDataLBL: UILabel!
    var productEventsArray:[ProductionModel] = []
    
    @IBOutlet var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        self.title = "JulongSoft"
       // self.title = UIColor.white.cgColor as! String
        
        if productEventsArray.count > 0
        {
             noDataLBL.isHidden = true
            tblView.reloadData()
        }else{
            
            noDataLBL.isHidden = false
            tblView.isHidden = true
            
        }
        
        
        
        
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return productEventsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor(red: 0.863, green: 0.863, blue: 0.863, alpha: 1).cgColor
        cell.configureCellWith1(data: productEventsArray[indexPath.row])
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
      
        
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DropViewController") as! DropViewController
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
                let model =  productEventsArray[indexPath.row]
                vc.dropEventsArray = model.varientDetails
        self.present(vc, animated: true, completion: nil)
        
    }


}
