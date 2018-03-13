//
//  DemoCell.swift
//  TableviewDemo
//
//  Created by apple on 2018-02-22.
//  Copyright © 2018 Doth Solutions. All rights reserved.
//

import UIKit

class DemoCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
