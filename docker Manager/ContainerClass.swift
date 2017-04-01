//
//  ContainerClass.swift
//  docker Manager
//
//  Created by Developer on 17/03/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import Foundation
import UIKit

class Container {
    var id: String
    var names: [String]
    var image_name: String
    var image_id: String
    var command: String
    var created: Int
    var state: String
    var status: String
    var ports: [[String:Any]]
    var finishedAt: String
    var volumes: [[String : Any]]
    
    init(id:String, names:[String], image_name:String = "", image_id:String = "", command:String = "", created:Int = 0, state:String = "", status:String = "", ports:[[String:Any]] = [], finishedAt: String = "", volumes: [[String:Any]]) {
        self.id = id
        self.names = names
        self.image_name = image_name
        self.image_id = image_id
        self.command = command
        self.created = created
        self.state = state
        self.status = status
        self.ports = ports
        self.finishedAt = finishedAt
        self.volumes = volumes
    }
    
    func getImgState() -> UIImage? {
        
        if(state == "running"){
            return UIImage(named: "icon-up")
        }else
        {
            return UIImage(named: "icon-down")
        }
    }
    
    func getName() -> String? {
        if names.count > 0{
            return names[0]
        }
        return nil
    }
    
    func getCreatedAt() -> String {
       
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm:ss"
        
        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(created)))
    }
    
    func getFormattedPorts() -> String{
        let strPorts = ""
        
        print(ports)
        
        /*for port in ports {
            //strPorts += port["PublicPort"]
        }*/
        
        return strPorts
    }

    func getFormattedVolume() -> String {
        var volume = ""
        
        if volumes.count > 0 {
            
            volume += volumes.first?["Destination"] as! String
        }
        
        return volume
    }
    
    func getLogs() -> String {
        var logs = ""
        print("before logs")
        logs = APIController().getLogs(uuid: self.id)
        print("after logs")
        return logs
    }
    
    
//    func getImage() -> Image {
//        
//    }
    
}
