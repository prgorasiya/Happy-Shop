//
//  ProductModel.swift
//  Happy Shop
//
//  Created by Paras Gorasiya on 21/8/17.
//  Copyright © 2017 Paras Gorasiya. All rights reserved.
//

import UIKit
import ObjectMapper

class ProductModel: Basemodel {

    var name: String?
    var category: String?
    var price: Float?
    var img_url: String?
    var description: String?
    var under_sale: Bool?
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        name <- map["name"]
        category <- map["category"]
        price <- map["price"]
        img_url <- map["img_url"]
        description <- map["description"]
        under_sale <- map["under_sale"]
    }
}
