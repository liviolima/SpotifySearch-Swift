//
//  ViewController.swift
//  SpotifySearch
//
//  Created by Livio de Lima Sales on 30/12/16.
//  Copyright © 2016 LivioLima. All rights reserved.
//

import UIKit
import Alamofire

class TableViewController: UITableViewController {
    
    var searchURL = "https://api.spotify.com/v1/search?q=Iron+Maiden&type=album"

    typealias JSONStandard = [String: AnyObject]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        callAlamo(url: searchURL)
    }
    
    func callAlamo(url: String){
        Alamofire.request(url).responseJSON(completionHandler: {
            response in
            
            self.parseData(JSONData: response.data!)
            
        })
    }
    
    func parseData(JSONData : Data){
        do {
            var readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as? JSONStandard
        
            print(readableJSON)
        }
        catch{
            print(error)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

