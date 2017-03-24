//
//  ImageDetailsViewController.swift
//  docker Manager
//
//  Created by Developer on 24/03/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import UIKit

class ImageDetailsViewController: UITableViewController {
    
    var image:Image = Image(id: "AZERTY")
    
    @IBOutlet weak var lblImageTag: UILabel!
    @IBOutlet weak var lblImageSize: UILabel!
    @IBOutlet weak var lblImageNbre: UILabel!
    @IBOutlet weak var lblImageCreatedAt: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblImageTag.text = image.getTag()
        lblImageSize.text = String(image.size)
        lblImageNbre.text = String(image.number_containers)
        lblImageCreatedAt.text = image.getCreatedAt()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
