//
//  DropViewController.swift
//  JulongSoftDemo
//
//  Created by Aravind Durgam on 21/01/19.
//  Copyright © 2019 Aravind. All rights reserved.
//

import UIKit

class DropViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,SwipeDelegate {

    @IBOutlet var tblView: UITableView!
    @IBOutlet var dynamicView: ATDraggableDynamicView!
    
    var dropEventsArray:[VarientsModel] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        dynamicView.draggableAnimator.delegate = self

        tblView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let transition = CATransition()
        transition.duration = 0.0
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.dynamicView.layer.add(transition, forKey: nil)
        self.dynamicView.isHidden = false
        
    }
    
    
//Tableview Delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dropEventsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DropTableViewCell") as! DropTableViewCell

        cell.configureCellWith1(data: dropEventsArray[indexPath.row])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
    }

    
    // Called when swiping completed.
    func didFinishSwiping(_ isFinished: Bool) {
        if isFinished == true {
            self.dismiss(animated: true, completion: nil)
        }
    }

}
