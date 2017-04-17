//
//  NewContainerViewController.swift
//  docker Manager
//
//  Created by Developer on 30/03/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import UIKit

class NewContainerViewController: UIViewController {

    @IBOutlet weak var txtContainerName: UITextField!
    @IBOutlet weak var txtContainerImage: UITextField!
    @IBOutlet weak var txtContainerCmd: UITextField!
    @IBAction func saveNewContainer(_ sender: AnyObject) {
        let name = txtContainerName.text
        let image = txtContainerImage.text
        let cmd = txtContainerCmd.text
        
        if name != nil && image != nil && cmd != nil {
            let res = APIController(url: DataStore.getUrl()).createContainer(nameContainer: name!, nameImage: image!, cmd: cmd!)
            print(res)
            
            
            let saveController = UIAlertController(title: "Enregistrement", message: res, preferredStyle: UIAlertControllerStyle.alert)
            saveController.addAction(UIAlertAction(title: "Fermer", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(saveController, animated: true, completion: nil)
            
            
            let api = APIController(url: DataStore.getUrl())
            DataStore.containers = api.getContainerAll()

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
