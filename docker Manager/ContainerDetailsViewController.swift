//
//  ContainerDetailsViewController.swift
//  docker Manager
//
//  Created by Developer on 17/03/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import UIKit

class ContainerDetailsViewController: UITableViewController {
    
    var container:Container = Container(id: "0", names: ["TEST"], image_name: "ubuntu:latest", command: "echo 222", created: 1367854154,state: "running", ports: [], volumes: [] )

    @IBOutlet weak var lblContainerName: UILabel!
    
    @IBOutlet weak var lblContainerState: UILabel!
    
    @IBOutlet weak var lblContainerIP: UILabel!
    @IBOutlet weak var lblContainerCreatedAt: UILabel!
    
    @IBOutlet weak var lblImageName: UILabel!
    
    @IBOutlet weak var lblCmd: UILabel!
    @IBOutlet weak var lblPorts: UILabel!
    
    @IBOutlet weak var logsButton: UIButton!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var removeButton: UIButton!
    
    @IBOutlet weak var lblFinishedAt: UILabel!
    @IBOutlet weak var lblVolume: UILabel!
    
    @IBAction func logs(_ sender: AnyObject) {
        let logs = container.getLogs()
        
        let logsController = UIAlertController(title: "Logs", message:
            logs, preferredStyle: UIAlertControllerStyle.alert)
        logsController.addAction(UIAlertAction(title: "Fermer", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(logsController, animated: true, completion: nil)

    }
    @IBAction func play(_ sender: UIButton) {
        
        let api = APIController(url: DataStore.getUrl())
        
        let (status, response) = api.startContainer(id: container.id)
        
        if status {
            
            container = api.getContainer(uuid: container.id)
            refresh()

        }
        else{
            let errorPopover = UIAlertController(title: "Erreur", message: response, preferredStyle: UIAlertControllerStyle.alert)
            errorPopover.addAction(UIAlertAction(title: "Fermer", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(errorPopover, animated: true, completion: nil)
            
        }
    }
    @IBAction func stop(_ sender: UIButton) {

        let api = APIController(url: DataStore.getUrl())

        let (status, response) = api.stopContainer(id: container.id)
        
        if status {
            
            container = api.getContainer(uuid: container.id)
            
            refresh()
        }else{
            let errorPopover = UIAlertController(title: "Erreur", message: response, preferredStyle: UIAlertControllerStyle.alert)
            errorPopover.addAction(UIAlertAction(title: "Fermer", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(errorPopover, animated: true, completion: nil)
            
        }
        

        
    }
    
    @IBAction func remove(_ sender: UIButton) {
     
        let api = APIController(url: DataStore.getUrl())

        let (status, response) = api.removeContainer(id: container.id)
        
        if status {
            
            
            DataStore.containers = api.getContainerAll()
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let containerTableController = storyBoard.instantiateViewController(withIdentifier: "containerTableView") as! ContainerTableViewController
            self.navigationController?.pushViewController(containerTableController, animated: true)
        }else{
            let errorPopover = UIAlertController(title: "Erreur", message: response, preferredStyle: UIAlertControllerStyle.alert)
            errorPopover.addAction(UIAlertAction(title: "Fermer", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(errorPopover, animated: true, completion: nil)
            
        }

    }
    
    func refresh() {
        
        lblContainerName.text = container.getName()
        lblContainerState.text = container.state
        lblContainerCreatedAt.text = container.getCreatedAt()
        lblImageName.text = container.image_name
        lblCmd.text = container.command
        lblPorts.text = container.getFormattedPorts()
        lblFinishedAt.text = container.finishedAt
        
        lblVolume.text = container.getFormattedVolume()

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refresh()
        
        playButton.layer.backgroundColor = UIColor(red: 0x28/255, green: 0x60/255, blue: 0x90/255, alpha: 1).cgColor
        
        removeButton.layer.backgroundColor = UIColor(red: 0xC9/255, green: 0x30/255, blue: 0x2C/255, alpha: 1).cgColor
        
        stopButton.layer.backgroundColor = UIColor(red: 0x28/255, green: 0x60/255, blue: 0x90/255, alpha: 1).cgColor
        
        logsButton.layer.backgroundColor = UIColor(red: 0x28/255, green: 0x60/255, blue: 0x90/255, alpha: 1).cgColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
