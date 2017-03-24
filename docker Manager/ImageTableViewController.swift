//
//  ImageTableViewController.swift
//  docker Manager
//
//  Created by Developer on 24/03/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import UIKit

class ImageTableViewController: UITableViewController {
    var images:[Image] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        images = DataStore.images
        tabBarItem.badgeValue = String(DataStore.images.count)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Initialize Tab Bar Item
        tabBarItem = UITabBarItem(title: "Images", image: UIImage(named: "icon-image"), tag: 1)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return images.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "imageCell") as! ImageTableViewCell
        
        let image = images[indexPath.row]
        
        // Configure the cell...
        
        cell.update(tag: image.getTag())
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let index = tableView.indexPathForSelectedRow!
        
        let image = images[index.row]
        
        let details = segue.destination as! ImageDetailsViewController
        details.image = image
    }
}
