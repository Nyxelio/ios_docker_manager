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
    var jsonDataArray : [[String:Any]] = []
    var jsonData: [String:Any] = [:]
    let VALID_CODES = [200, 201, 204]
    
    func getContainerAll () -> [Container] {
        print("============= get Container all ============= ")
        let tmp_url = self.url + "/containers/json?all=1"
        var containers : [Container] = []
        let semaphore = DispatchSemaphore(value: 0)
        
        doCall(urlPath: tmp_url){ code in
            for item in self.jsonDataArray {
                print("============= test ============= ")
                
                let container = Container(id: (item["Id"] as? String)!, names: (item["Names"] as? [String])!, image_name: (item["Image"] as? String)!, image_id: (item["ImageID"] as? String)!, command: (item["Command"] as? String)!, created: (item["Created"] as? Int)!, state: (item["State"] as? String)!, status: (item["Status"] as? String)!, ports: (item["Ports"] as? [[String:Any]])!, volumes: (item["Mounts"] as? [[String:Any]])!)
                
                
                
                containers.append(container)
            }
            semaphore.signal()
        }
        semaphore.wait()
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
                print(data)
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String:Any]]
                
                if(json == nil) {
                    let test = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
                    self.jsonData = test!
                } else {
                    print(json)
                    
                    self.jsonDataArray = json!
                }
                
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
        self.jsonData = [:]
    }
    
    func resetJsonDataArray() {
        self.jsonDataArray = []
    }
    
    static func getUrl() -> String {
        let ip_server = ProcessInfo.processInfo.environment["IP_SERVER"]
        
        if(ip_server != nil)
        {
            return "http://\(ip_server!)"
        }
        
        return "http://91.121.184.50:31337"
    }
    
    static func startContainer(id: String) -> (status: Bool, response: String){
        let semaphore = DispatchSemaphore(value: 0)
        var status:Bool = false
        var responseString = ""
        
        var request = URLRequest(url: URL(string: "\(getUrl())/containers/\(id)/start")!)
        request.httpMethod = "POST"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                                 print("error=\(error)")
                return
            }
            
            /*if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
             print("statusCode should be 200, but is \(httpStatus.statusCode)")
             print("response = \(response)")
             }*/
            
            print("id:")
            print(id)
            
            
            let httpStatus = response as? HTTPURLResponse
            let statusCode = (httpStatus?.statusCode)!
            
            print(APIController().VALID_CODES)
            print(statusCode)
            
            if APIController().VALID_CODES.index(of: statusCode) != nil {
                status = true
            }
            
            responseString = String(data: data, encoding: .utf8)!
            print("responseString = \(responseString)")
            
            semaphore.signal()
        }
        task.resume()
        
        semaphore.wait()

        return (status, responseString)

    }
    static func stopContainer(id: String) -> Bool{
        var ret = false
        
        let semaphore = DispatchSemaphore(value: 0)
        
        var request = URLRequest(url: URL(string: "\(getUrl())/containers/\(id)/stop")!)
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                                 print("error=\(error)")
                return
            }
            
            /*if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
             print("statusCode should be 200, but is \(httpStatus.statusCode)")
             print("response = \(response)")
             }*/
            
            print("id:")
            print(id)
            
            let httpStatus = response as? HTTPURLResponse
            print(httpStatus?.statusCode)
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString)")
            
            semaphore.signal()
        }
        task.resume()
        
        semaphore.wait()
        
        ret = true

    
        return ret
        
    }
    
    static func removeContainer(id: String) -> Bool{
        var ret = false
        let semaphore = DispatchSemaphore(value: 0)

        var request = URLRequest(url: URL(string: "\(getUrl())/containers/\(id)")!)
        request.httpMethod = "DELETE"
        //let postString = "id=13&name=Jack"
        //request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                                 print("error=\(error)")
                return
            }
            
            /*if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }*/
            
            print("id:")
            print(id)
          
            let httpStatus = response as? HTTPURLResponse
            print(httpStatus?.statusCode)
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString)")
            
            ret = true
            
            semaphore.signal()
        }
        task.resume()
        
        semaphore.wait()
        
        ret = true

        return ret
    }
    
    
    // get specific container
    func getContainer (uuid : String) -> Container {
        print("============= get Container ============= ")
        let tmp_url = "\(self.url)/containers/\(uuid)/json"
        var containers : [Container] = []
        let semaphore = DispatchSemaphore(value: 0)
        
        doCall(urlPath: tmp_url){ code in
            print("============= json data ============= ")
            print(self.jsonData)
            let item = self.jsonData
            
            var names : [String] = []
            names.append((item["Name"] as? String)!)
            
            let config = item["Config"] as? [String:Any]
            let image_name = config?["Image"]
            let cmdArray = config?["Cmd"] as? [String]
            let cmd = cmdArray?[0]
            
            
            let state = item["State"] as? [String:Any]
            let status = state?["Status"]
            let finishedAt = state?["FinishedAt"]
            
            let container = Container(id: (item["Id"] as? String)!, names: names, image_name: (image_name as? String)!, command: (cmd )!, state: (status as? String)!, status: (status as? String)!, finishedAt: (finishedAt as? String)!, volumes: (item["Mounts"] as? [[String:Any]])!)
            
            print("in callback")
            containers.append(container)
            semaphore.signal()
        }
        semaphore.wait()
        return containers[0]
    }
    
    
    // Get logs
    func getLogs (uuid: String) -> String {
        
        let semaphore = DispatchSemaphore(value: 0)
        
        var responseString = ""
        
        let request = URLRequest(url: URL(string: "\(self.url)/containers/\(uuid)/logs?stdout=true&stderr=true")!)
        //let postString = "id=13&name=Jack"
        //request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                                 print("error=\(error)")
                return
            }
            
            /*if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
             print("statusCode should be 200, but is \(httpStatus.statusCode)")
             print("response = \(response)")
             }*/
            
            print("id:")
            print(uuid)
            
            let httpStatus = response as? HTTPURLResponse
            print(httpStatus?.statusCode)
            
            print(data)
            let formattedData = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            
            if formattedData != nil {
                responseString = formattedData! as String

            }
            
            print("responseString = \(responseString)")
            
            
            semaphore.signal()
        }
        task.resume()
        
        semaphore.wait()
        
        
        return responseString
    }
    
    //Creation container
    func createContainer (nameContainer: String, nameImage: String, cmd: String) -> String{
        var toReturn : String = ""
        let semaphore = DispatchSemaphore(value: 0)
        let parameters = ["image": nameImage, "cmd": cmd] as Dictionary<String, Any>
        
        let tmp_url = self.url + "/containers/create?name=\(nameContainer)"
        let session = URLSession.shared
        
        var request = URLRequest(url: URL(string: tmp_url)!)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard data != nil else {
                return
            }
            
            do {
                //create json object from data
                
                let httpStatus = response as? HTTPURLResponse
                let httpStatusCode:Int = (httpStatus?.statusCode)!
                
                switch httpStatusCode {
                case 201:
                    toReturn = "Conteneur créé !"
                    break;
                case 404:
                    toReturn = "Aucune image ne correspond à votre demande !"
                    break;
                case 400:
                    toReturn = "Mauvais paramètre !"
                    break;
                default:
                    toReturn = ""
                    break;
                    
                }
                
                semaphore.signal()
                
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
        semaphore.wait()
        return toReturn
    }

    
    ////////////////////IMAGES ///////////////////////
    // Get all image
    func getAllImage () -> [Image] {
        let tmp_url = self.url + "/images/json?all=1"
        var images : [Image] = []
        let semaphore = DispatchSemaphore(value: 0)
        
        doCall(urlPath: tmp_url){ code in
            for item in self.jsonDataArray {
                let image = Image(id: (item["Id"] as? String)!, parentId: (item["ParentId"] as? String)!, repoTags: (item["RepoTags"] as? [String])!, repoDigests: (item["RepoDigests"] as? [String])!, created: (item["Created"] as? Int)!, size: (item["Size"] as? Int)!, virtualSize: (item["VirtualSize"] as? Int)!, sharedSize: (item["SharedSize"] as? Int)!, number_containers: (item["Containers"] as? Int)!)
                
                images.append(image)
            }
            semaphore.signal()
        }
        semaphore.wait()
        resetJsonDataArray()
        return images
    }
    /////////////////////////////////////////////////
}
