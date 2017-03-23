//
//  ContainerTableViewCell.swift
//  docker Manager
//
//  Created by Developer on 17/03/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import UIKit

class ContainerTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imgContainerState: UIImageView!
    
    @IBOutlet weak var lblContainerName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func update(name: String?, imgState: UIImage?) {
        if (name != nil) {
            lblContainerName.text = name!
        }
        
        if(imgState != nil){
            imgContainerState.image = imgState!
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
