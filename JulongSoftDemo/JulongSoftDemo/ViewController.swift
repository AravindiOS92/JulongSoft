//
//  ViewController.swift
//  JulongSoftDemo
//
//  Created by Aravind Durgam on 20/01/19.
//  Copyright © 2019 Aravind. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet var collectionView: UICollectionView!
    
  let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var arrayEventDetailModel = [ArrayDataModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "JulongSoft"
      //  self.title = UIColor.white.cgColor as! String
        // Do any additional setup after loading the view, typically from a nib.
        callAPI2()
    }

    //CollectionView delegate methods:
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrayEventDetailModel.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CustomCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
       // cell.titltLBL.text = categoryArray.index
        
        cell.configureCellWith(data: arrayEventDetailModel[indexPath.row])
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
      
        var controller = PrdouctViewController()
        controller =  self.storyboard!.instantiateViewController(withIdentifier: "PrdouctViewController") as! PrdouctViewController
       let model =  arrayEventDetailModel[indexPath.row]
        controller.productEventsArray = model.collectionDetails
        self.navigationController?.pushViewController(controller, animated:true)
        
        
    }
    
    
    
    
    //API Calling
    
    func callAPI2()
    {
     
            //  Spinner.sharedAlert().show()
       //     activityIndicatorView.startAnimating()
        
            let headers = [
                "cache-control": "no-cache",
                //"Authorization": "Token" + " " + appDelegate.loginToken
                //"postman-token": "b81ac5f0-0f76-b925-4684-e5d9b3944711"
            ]
            
        
            
            let request = NSMutableURLRequest(url: NSURL(string: "https://stark-spire-93433.herokuapp.com/json")! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 200)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                
                
                if let httpResponse = response as? HTTPURLResponse {
                    print("error \(httpResponse.statusCode)")
                }
                DispatchQueue.main.async {
                    
                  //  self.activityIndicatorView.stopAnimating()
                 
                    // Spinner.sharedAlert().hide()
                   
                    
                    
                }
                if (error != nil) {
                    print(error)
                } else {
                    let httpResponse = response as? HTTPURLResponse
                    print(httpResponse)
                    
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                        print(jsonResponse as! NSDictionary)
                        let json = JSON(jsonResponse)
                        print(json)
                        
                        
                        guard let resultData = json.dictionary  else {
                            print("No category array")
                            return}
                        print(resultData)
                        DispatchQueue.main.async {
                            let model = CategoryModel(eventDetails: resultData as NSDictionary)
                            
                            //self.appDelegate.categoryDict  = model


                            self.arrayEventDetailModel = model.similarDetails
                            
                            
                            self.collectionView.reloadData()
                          
                            //  Spinner.sharedAlert().hide()
                         
                        }
                    }
                    catch let error
                    {
                        print(error)
                    }
                    
                }
            })
            
            dataTask.resume()
            
        }
        
    
    
    

}

