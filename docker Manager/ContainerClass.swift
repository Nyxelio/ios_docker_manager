//
//  ContainerClass.swift
//  docker Manager
//
//  Created by Developer on 17/03/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import Foundation

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
    
    init(id:String, names:[String], image_name:String, image_id:String, command:String, created:Int, state:String, status:String, ports:[[String:Any]]) {
        self.id = id
        self.names = names
        self.image_name = image_name
        self.image_id = image_id
        self.command = command
        self.created = created
        self.state = state
        self.status = status
        self.ports = ports
    }
    
    
    
//    func getImage() -> Image {
//        
//    }
    
}
