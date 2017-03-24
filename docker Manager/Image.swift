//
//  Image.swift
//  docker Manager
//
//  Created by Developer on 17/03/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import Foundation

class Image {
    var id : String
    var parentId :String
    var repoTags: [String]
    var repoDigests: [String]
    var created: Int
    var size :Int
    var virtualSize: Int
    var sharedSize : Int
    var number_containers : Int
    
    init(id: String, parentId: String = "", repoTags: [String] = [], repoDigests: [String] = [], created : Int = 0, size: Int = 0, virtualSize : Int = 0, sharedSize : Int = 0, number_containers : Int = 0) {
        self.id = id
        self.parentId = parentId
        self.repoTags = repoTags
        self.repoDigests = repoDigests
        self.created = created
        self.size = size
        self.virtualSize = virtualSize
        self.sharedSize = sharedSize
        self.number_containers = number_containers
    }
    
    func getTag() -> String? {
        return repoTags[0]
    }
    
    
    func getCreatedAt() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm:ss"
        
        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(created)))
    }
    

}
