//
//  Record.swift
//  PettyPet
//
//  Created by Pinar Olguc on 11/12/2016.
//  Copyright © 2016 Petty Pet AS. All rights reserved.
//

import Foundation

enum RecordStatus {
    case preparing
    case active
    case soldout
}

struct Record {
    let cat: Cat
    let date: Date
    let redordId: Int
    let status: RecordStatus
    let owner: RecordOwner
    let price: Double?
    
    func priceText() -> String {
        if let unwrappedPrice = price {
            return String(describing: unwrappedPrice)
        } else {
            return "Gorusulur"
        }
    }
}
