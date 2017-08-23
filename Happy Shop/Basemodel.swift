//
//  Basemodel.swift
//  Happy Shop
//
//  Created by Paras Gorasiya on 21/8/17.
//  Copyright © 2017 Paras Gorasiya. All rights reserved.
//

import UIKit
import ObjectMapper

class Basemodel:Mappable {
    
    var id: Int?
    
    /// This function can be used to validate JSON prior to mapping. Return nil to cancel mapping at this point
    required init?(map: Map) {
        
    }
    
    
    /// This function is where all variable mappings should occur. It is executed by Mapper during the mapping (serialization and deserialization) process.
    func mapping(map: Map) {
        id <- map["id"]
    }

}
