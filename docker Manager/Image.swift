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
    
    init(id: String, parentId: String, repoTags: [String], repoDigests: [String], created : Int, size: Int, virtualSize : Int, sharedSize : Int, number_containers : Int) {
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
    
}
