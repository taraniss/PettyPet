//
//  CatsResponse.swift
//  PettyPet
//
//  Created by Can Hosgor on 29/12/2016.
//  Copyright © 2016 Petty Pet AS. All rights reserved.
//

import Foundation
import ObjectMapper

class CatsResponse: Mappable {
    var success: Bool
    var data: [Record]?

    required init?(map: Map){
        success = false
    }

    func mapping(map: Map) {
        success <- map["success"]
        data <- map["data"]
    }
}
