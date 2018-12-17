//
//  Meal.swift
//  FoodTaskerMobile
//
//  Created by Макс on 17/12/2018.
//  Copyright © 2018 Макс. All rights reserved.
//

import Foundation
import SwiftyJSON

class Meal {
    
    var id: Int?
    var name: String?
    var shortDescription: String?
    var image: String?
    var price: Float?
    
    init(json: JSON) {
        
        self.id = json["id"].int
        self.name = json["name"].string
        self.shortDescription = json["short_description"].string
        self.image = json["image"].string
        self.price = json["price"].float
    }
}
