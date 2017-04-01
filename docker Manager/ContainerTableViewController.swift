//
//  ContainerTableViewController.swift
//  docker Manager
//
//  Created by Developer on 17/03/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import UIKit

class ContainerTableViewController: UITableViewController {

    var containers:[Container] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        containers = DataStore.containers
        tabBarItem.badgeValue = String(DataStore.containers.count)
        
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(ContainerTableViewController.refresh), for: UIControlEvents.valueChanged)
        self.refreshControl = refreshControl
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Initialize Tab Bar Item
        tabBarItem = UITabBarItem(title: "Containers", image: UIImage(named: "icon-server"), tag: 1)

    }
    
    func refresh() {
        
        let api = APIController()
        
        DataStore.containers = api.getContainerAll()

        containers = DataStore.containers
        tabBarItem.badgeValue = String(DataStore.containers.count)
        
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(section == 0){
                return 1
        }
        
        return containers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "containerCtrlCell") as! ContainerCtrlCell
            return cell
        }
        else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "containerCell") as! ContainerTableViewCell
            
            let container = containers[indexPath.row]
            
            cell.update(name: container.getName(), imgState: container.getImgState())
            return cell
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (tableView.indexPathForSelectedRow != nil) {
            let index = tableView.indexPathForSelectedRow!
            
            let container = containers[index.row]
            
            let details = segue.destination as! ContainerDetailsViewController
            details.container = container

        }
      }
}
