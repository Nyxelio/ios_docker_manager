//
//  ControllerAPI.swift
//  docker Manager
//
//  Created by Developer on 23/03/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import Foundation

class APIController {
    let url = "http://91.121.184.50:31337"
    var jsonData : [[String:Any]] = []
    
    
    // Get all container
    func getContainerAll () -> [Container] {
        let tmp_url = self.url + "/containers/json?all=1"
        var containers : [Container] = []
        doCall(urlPath: tmp_url){ code in
            for item in self.jsonData {
                print("============= test ============= ")
                
                let container = Container(id: (item["Id"] as? String)!, names: (item["Names"] as? [String])!, image_name: (item["Image"] as? String)!, image_id: (item["ImageID"] as? String)!, command: (item["Command"] as? String)!, created: (item["Created"] as? Int)!, state: (item["State"] as? String)!, status: (item["Status"] as? String)!, ports: (item["Ports"] as? [[String:Any]])!)
                
                containers.append(container)
            }
        }
        return containers
    }
    
    func doCall (urlPath:String, completion: @escaping (Int) -> ()) {
        print(urlPath)
        var request = URLRequest(url: URL(string: urlPath)!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print(error!)
                completion(0)
                return
            }
            guard let data = data else {
                print("Data is empty")
                completion(0)
                return
            }
            
            
            do {
                let httpStatus = response as? HTTPURLResponse
                let httpStatusCode:Int = (httpStatus?.statusCode)!
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
                //                let item = json["Command"] as? [String:Any]
                //                print(json)
                //                for item in json! {
                //                    //                    for test in item {
                //                    //                        print(test)
                //                    //                    }
                //                    print("=============== item ===========")
                //                    print(item)
                ////                    let test = item["NetworkSettings"] as? [String: Any]
                ////                    print(test)
                //                }
                //                                let item = json["Networks"] as? [[String:AnyObject]]
                //                                for item in json! {
                //                                    for test in item {
                //                                        print(test)
                //                                    }
                //
                ////                                    toReturn = item["NetworkSettings"] as? [String: Any]
                //
                //                                }
                
                self.jsonData = json!
                completion(httpStatusCode)
            } catch {
                print("json marche pas")
            }
            
            
            //            let response = String(data: data, encoding: .utf8)
            //            let item = json?.first as? [String: Any]
            
            //            print(json["Id"])
            
        }
        
        task.resume()
    }
    
    func resetJsonData() {
        self.jsonData = []
    }
}
