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
        print("action")
        let logs = container.getLogs()
        print("logs")
        print(logs)
        
        let logsController = UIAlertController(title: "Logs", message:
            logs, preferredStyle: UIAlertControllerStyle.alert)
        logsController.addAction(UIAlertAction(title: "Fermer", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(logsController, animated: true, completion: nil)

    }
    @IBAction func play(_ sender: UIButton) {
        
        print("play")
        
        let res = APIController.startContainer(id: container.id)
        
        print(res)
        if res {
            print("ok")
            
            let api = APIController()
            
            container = api.getContainer(uuid: container.id)
            
            print("on play return")
            print(container.state)
            refresh()

        }
    }
    @IBAction func stop(_ sender: UIButton) {
        print("stop")
        
        let res = APIController.stopContainer(id: container.id)
        
        //TMP
        
        if res {
            print("ok")
            
            let api = APIController()
            
            container = api.getContainer(uuid: container.id)
            
            print("on stop return")
            print(container.state)
            refresh()
        }

        
    }
    
    @IBAction func remove(_ sender: UIButton) {
        print("remove")
        
        
        let res = APIController.removeContainer(id: container.id)
        
        if res {
            print("ok")
        }

    }
    
    func refresh() {
        
        lblContainerName.text = container.getName()
        lblContainerState.text = container.state
        //lblContainerIP.text = container.IP
        lblContainerCreatedAt.text = container.getCreatedAt()
        lblImageName.text = container.image_name
        lblCmd.text = container.command
        lblPorts.text = container.getFormattedPorts()
        lblFinishedAt.text = container.finishedAt
        
        lblVolume.text = container.getFormattedVolume()

        
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
    
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return containers.count
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "containerCell") as! ContainerTableViewCell
        
        /*let container = containers[indexPath.row]
        
        // Configure the cell...
        
        cell.update(name: container.getName(), imgState: container.getImgState())*/
        return cell
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
