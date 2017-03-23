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
