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
        let ip_server = ProcessInfo.processInfo.environment["IP_SERVER"]
        
        if(ip_server != nil)
        {
            print(ip_server!)
        }
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
