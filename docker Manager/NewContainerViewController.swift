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
    @IBAction func saveNewContainer(_ sender: AnyObject) {
        let name = txtContainerName.text
        let image = txtContainerImage.text
        
        if name != nil && image != nil {
            let res = APIController().createContainer(nameContainer: name!, nameImage: image!)
            print(res)
            
            
            let saveController = UIAlertController(title: "Enregistrement", message: res, preferredStyle: UIAlertControllerStyle.alert)
            saveController.addAction(UIAlertAction(title: "Fermer", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(saveController, animated: true, completion: nil)
            
            
            let api = APIController()
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
