//
//  AttractionTableViewCell.swift
//  TableViewStory
//
//  Created by na on 2016. 11. 17..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit

class AttractionTableViewCell: UITableViewCell {

    @IBOutlet var attractionImage: UIImageView!
    @IBOutlet var attractionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
