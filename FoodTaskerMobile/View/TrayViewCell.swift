//
//  TrayViewCell.swift
//  FoodTaskerMobile
//
//  Created by Макс on 28/12/2018.
//  Copyright © 2018 Макс. All rights reserved.
//

import UIKit

class TrayViewCell: UITableViewCell {

    @IBOutlet weak var lbQty: UILabel!
    @IBOutlet weak var lbMealName: UILabel!
    @IBOutlet weak var lbSubTotal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        lbQty.layer.borderColor = UIColor.gray.cgColor
        lbQty.layer.borderWidth = 1.0
        lbQty.layer.cornerRadius = 10
    }

}
