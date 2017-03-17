//
//  ContainerDetailsViewController.swift
//  docker Manager
//
//  Created by Developer on 17/03/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import UIKit

class ContainerDetailsViewController: UIViewController {
    
    var container:ContainerData = ContainerData(Id: "0", Name: "")

    @IBOutlet weak var lblContainerId: UILabel!
    @IBOutlet weak var lblContainerName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblContainerId.text = container.Id;
        lblContainerName.text = container.Name;
        
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
