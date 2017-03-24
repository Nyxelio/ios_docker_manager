//
//  ImageDetailsTableViewController.swift
//  docker Manager
//
//  Created by Developer on 24/03/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import UIKit

class ImageDetailsTableViewController: UITableViewController {
    
    var container:Container = Container(id: "0", names: ["TEST"], image_name: "ubuntu:latest", command: "echo 222", created: 1367854154,state: "running", ports: [] )
    
    @IBOutlet weak var lblContainerName: UILabel!
    
    @IBOutlet weak var lblContainerState: UILabel!
    
    @IBOutlet weak var lblContainerIP: UILabel!
    @IBOutlet weak var lblContainerCreatedAt: UILabel!
    
    @IBOutlet weak var lblImageName: UILabel!
    
    @IBOutlet weak var lblCmd: UILabel!
    @IBOutlet weak var lblPorts: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var removeButton: UIButton!
    
    @IBOutlet weak var lblFinishedAt: UILabel!
    
    
    func refresh() {
        
        lblContainerName.text = container.getName()
        lblContainerState.text = container.state
        //lblContainerIP.text = container.IP
        lblContainerCreatedAt.text = container.getCreatedAt()
        lblImageName.text = container.image_name
        lblCmd.text = container.command
        lblPorts.text = container.getPortsAsString()
        lblFinishedAt.text = container.finishedAt
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        refresh()
        
        playButton.layer.backgroundColor = UIColor(red: 0x28/255, green: 0x60/255, blue: 0x90/255, alpha: 1).cgColor
        
        removeButton.layer.backgroundColor = UIColor(red: 0xC9/255, green: 0x30/255, blue: 0x2C/255, alpha: 1).cgColor
        
        stopButton.layer.backgroundColor = UIColor(red: 0x28/255, green: 0x60/255, blue: 0x90/255, alpha: 1).cgColor
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
