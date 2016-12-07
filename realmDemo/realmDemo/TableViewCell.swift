//
//  TableViewCell.swift
//  realmDemo
//
//  Created by na on 2016. 12. 7..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var NameLabel : UILabel!
    @IBOutlet var SubLabel : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
