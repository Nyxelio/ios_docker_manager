//
//  ContainerTableViewController.swift
//  docker Manager
//
//  Created by Developer on 17/03/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import UIKit

class ContainerTableViewController: UITableViewController {

    //var containers:[Container] = []
    var containers:[Container] = []

    //@IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        containers = DataStore.containers
        tabBarItem.badgeValue = String(DataStore.containers.count)
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Initialize Tab Bar Item
        tabBarItem = UITabBarItem(title: "Containers", image: UIImage(named: "icon-server"), tag: 1)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if(section == 0){
                return 1
        }
        
        return containers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "containerCtrlCell")
            return cell!
        }
        else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "containerCell") as! ContainerTableViewCell
            
            let container = containers[indexPath.row]
            
            // Configure the cell...
            
            cell.update(name: container.getName(), imgState: container.getImgState())
            return cell
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.

        if (tableView.indexPathForSelectedRow != nil) {
            let index = tableView.indexPathForSelectedRow!
            
            let container = containers[index.row]
            
            let details = segue.destination as! ContainerDetailsViewController
            details.container = container

        }
      }
}
