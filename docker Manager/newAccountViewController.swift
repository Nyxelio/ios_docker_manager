//
//  newAccountViewController.swift
//  docker Manager
//
//  Created by Developer on 17/04/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import UIKit

class newAccountViewController: UIViewController {
    @IBOutlet weak var edtNewUrl: UITextField!

    @IBOutlet weak var edtNewName: UITextField!
    
    @IBOutlet weak var btnSave: UIButton!
    
    @IBAction func addNewAccount(_ sender: AnyObject) {
        
        let name = edtNewName.text
        let url = edtNewUrl.text
        
        if name != nil && url != nil {
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let account = Account(context: context)
            account.name = name!
            account.url = url!
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            let saveController = UIAlertController(title: "Enregistrement", message: "Nouveau compte créé !", preferredStyle: UIAlertControllerStyle.alert)
            saveController.addAction(UIAlertAction(title: "Fermer", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(saveController, animated: true, completion: nil)
        }
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnSave.layer.backgroundColor = UIColor(red: 0x9B/255, green: 0x59/255, blue: 0xB6/255, alpha: 1).cgColor

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
