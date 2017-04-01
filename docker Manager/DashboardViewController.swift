//
//  DashboardViewController.swift
//  docker Manager
//
//  Created by Developer on 16/03/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController
{
    @IBOutlet weak var lblCountImages: UILabel!
    @IBOutlet weak var lblCountContainers: UILabel!
    
    @IBOutlet weak var lblCountVolumes: UILabel!
    
    @IBOutlet weak var lblCountNetworks: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let api = APIController()

        if api.isAccessible() {
            
            
            lblCountContainers.text = String(DataStore.containers.count)
            
            lblCountImages.text = String(DataStore.images.count)
            

        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Initialize Tab Bar Item
        tabBarItem = UITabBarItem(title: "Dashboard", image: UIImage(named: "icon-dashboard"), tag: 0)
        
    }
}
