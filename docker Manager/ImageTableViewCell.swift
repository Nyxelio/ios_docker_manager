//
//  ImageTableViewCell.swift
//  docker Manager
//
//  Created by Developer on 24/03/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblImageName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func update(name: String?) {
        if (name != nil) {
            lblImageName.text = name!
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
