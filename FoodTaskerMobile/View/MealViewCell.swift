//
//  MealViewCell.swift
//  FoodTaskerMobile
//
//  Created by Макс on 17/12/2018.
//  Copyright © 2018 Макс. All rights reserved.
//

import UIKit

class MealViewCell: UITableViewCell {
    @IBOutlet weak var lbMealShortDescription: UILabel!
    @IBOutlet weak var lbMealName: UILabel!
    @IBOutlet weak var lbMealPrice: UILabel!
    @IBOutlet weak var imgMealImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}
