//
//  Record.swift
//  PettyPet
//
//  Created by Pinar Olguc on 11/12/2016.
//  Copyright © 2016 Petty Pet AS. All rights reserved.
//

import Foundation
import ObjectMapper

enum RecordStatus {
    case preparing
    case active
    case soldout
}

class Record: Mappable {
    var cat: Cat?
    var date: Date?
    var redordId: Int?
    var status: RecordStatus?
    var owner: RecordOwner?
    var price: Double?

    func priceText() -> String {
        if let unwrappedPrice = price {
            return String(describing: unwrappedPrice)
        } else {
            return "Gorusulur"
        }
    }

    required init?(map: Map) {
    }

    func mapping(map: Map) {
        cat <- map["cat"]
        date <- map["date"]
        redordId <- map["recordId"]
        status <- map["status"]
        owner <- map["owner"]
        price <- map["price"]
    }
}
