//
//  DataStore.swift
//  docker Manager
//
//  Created by Developer on 24/03/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import Foundation

class DataStore {
    static var system: System = System()
    static var containers:[Container] = []
    static var images:[Image] = []
    static var currentAccountUrl: String = ""
    
    static func getUrl() -> String {
        
        if DataStore.currentAccountUrl != "" {
            return DataStore.currentAccountUrl
        }
        
        let ip_server = ProcessInfo.processInfo.environment["IP_SERVER"]
        
        if(ip_server != nil)
        {
            return "http://\(ip_server!)"
        }
        return ""
    }
}
