//
//  System.swift
//  docker Manager
//
//  Created by Developer on 02/04/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import Foundation


class System {
    var containersCount : Int
    var runningContainersCount: Int
    var stoppedContainersCount: Int
    var imagesCount: Int
    var name: String
    var os: String
    var architecture: String
    
    init(containersCount: Int = 0, runningContainersCount: Int = 0, stoppedContainersCount: Int = 0, imagesCount: Int = 0, name: String = "", os: String = "", architecture:String = "") {
        self.containersCount = containersCount
        self.runningContainersCount = runningContainersCount
        self.stoppedContainersCount = stoppedContainersCount
        self.imagesCount = imagesCount
        self.name = name
        self.os = os
        self.architecture = architecture
    }
}
