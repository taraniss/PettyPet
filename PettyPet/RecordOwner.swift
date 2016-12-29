//
//  RecordOwner.swift
//  PettyPet
//
//  Created by Pinar Olguc on 11/12/2016.
//  Copyright © 2016 Petty Pet AS. All rights reserved.
//

import Foundation
import ObjectMapper

class RecordOwner:Mappable {
    var name: String?
    var surname: String?
    var phone: String?

    func mapping(map: Map) {
        name <- map["name"]
        surname <- map["surname"]
        phone <- map["phone"]
    }

    required init?(map: Map) {
    }
}
