//
//  ViewController.swift
//  docker Manager
//
//  Created by Developer on 16/03/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let api = APIController()
        api.getContainerAll()
//        print("toto")
//
//        var request = URLRequest(url: URL(string: "http://91.121.184.50:31337/containers/json?all=1")!)
//        request.httpMethod = "GET"
//        
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard error == nil else {
//                print(error!)
//                return
//            }
//            guard let data = data else {
//                print("Data is empty")
//                return
//            }
//            
//            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
////                let item = json["Command"] as? [String:Any]
////                 print(json)
////                let item = json["Networks"] as? [[String:AnyObject]]
//                for item in json! {
////                    for test in item {
////                        print(test)
////                    }
//                    
//                    let test = item["NetworkSettings"] as? [String: Any]
//                    print(test)
//                }
//               
//                
//                
//            } catch {
//                print("json marche pas")
//                
//            }
//            
//            
////            let response = String(data: data, encoding: .utf8)
////            let item = json?.first as? [String: Any]
//            
////            print(json["Id"])
//            
//            
//            
//        }
//        
//        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

