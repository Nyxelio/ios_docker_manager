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

        DataStore.containers = api.getContainerAll()
        DataStore.images = api.getAllImage()
        
        print("DISPATCHER")
        
        //print(DataStore.containers)
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
