//
//  DispatcherController.swift
//  docker Manager
//
//  Created by Developer on 16/03/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import UIKit

class DispatcherController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        
        
        let api = APIController()
        
        if api.isAccessible() {
            
            DataStore.system = api.getInfo()
            
            DataStore.containers = api.getContainerAll()
            DataStore.images = api.getAllImage()

        }
        
        // tabbar background
        tabBar.barTintColor = UIColor(red: 0x9B/255, green: 0x59/255, blue: 0xB6/255, alpha: 1)
        
        tabBar.tintColor = UIColor.white
               
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.blue], for: .selected)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
