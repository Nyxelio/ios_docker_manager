//
//  DashboardTableViewController.swift
//  docker Manager
//
//  Created by Developer on 02/04/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import UIKit

class DashboardTableViewController: UITableViewController {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblOS: UILabel!
    @IBOutlet weak var lblArchitecture: UILabel!
    @IBOutlet weak var lblContainersCount: UILabel!

    @IBOutlet weak var lblRunningContainersCount: UILabel!
    
    @IBOutlet weak var lblStoppedContainersCount: UILabel!
    @IBOutlet weak var lblImagesCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    
        
        let api = APIController(url: DataStore.getUrl())
        
        if api.isAccessible() {
            
            let info = DataStore.system
            
            lblName.text = info.name
            lblOS.text = info.os
            lblArchitecture.text = info.architecture
            lblContainersCount.text = String(info.containersCount)
            lblRunningContainersCount.text = String(info.runningContainersCount)
            lblStoppedContainersCount.text = String(info.stoppedContainersCount)
            
            lblImagesCount.text = String(info.imagesCount)
            
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

    // MARK: - Table view data source

    /*override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }*/

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
