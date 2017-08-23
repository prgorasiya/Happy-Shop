//
//  ProductsContainerModel.swift
//  Happy Shop
//
//  Created by Paras Gorasiya on 21/8/17.
//  Copyright © 2017 Paras Gorasiya. All rights reserved.
//

import UIKit
import ObjectMapper

class ProductsContainerModel: Basemodel {

    var products = [ProductModel]()
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        products <- map["products"]
    }
}
