//
//  StartViewController.swift
//  docker Manager
//
//  Created by Developer on 23/03/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var newAccountButton: UIButton!
    @IBOutlet weak var demoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        demoButton.layer.cornerRadius = 9
        demoButton.layer.borderColor = UIColor.white.cgColor
        demoButton.layer.borderWidth = 1.5
        
        newAccountButton.layer.cornerRadius = 9
        newAccountButton.layer.borderColor = UIColor.white.cgColor
        newAccountButton.layer.borderWidth = 1.5
        
        demoButton.tintColor = UIColor.white
        newAccountButton.tintColor = UIColor.white
        
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        let account = Account(context: context)
        account.name = "Demo"
        account.url = "http://91.121.184.50:31337"
        DataStore.currentAccountUrl = account.url!
        
        // Save the data to coredata
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //fetch
        do {
            let accounts = try context.fetch(Account.fetchRequest())
            print(accounts)
            //track current account
            //DataStore.currentAccountName = (accounts[0] as! Account).name!
            //print(DataStore.currentAccountName)

        }
        catch {
            print("Failed to retrieve accounts")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
