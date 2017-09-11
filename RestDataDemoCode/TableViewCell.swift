//
//  TableViewCell.swift
//  RestDataDemoCode
//
//  Created by AM Esfar-E-Alam on 7/6/17.
//  Copyright © 2017 RJTCOMPUQUEST. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
