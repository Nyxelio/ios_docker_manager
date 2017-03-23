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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //lblCountImages.text = "10"
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Initialize Tab Bar Item
        tabBarItem = UITabBarItem(title: "Dashboard", image: UIImage(named: "icon-dashboard"), tag: 0)
        
        //tabBarItem.badgeValue = 8
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
