//
//  Cat.swift
//  PettyPet
//
//  Created by Pinar Olguc on 11/12/2016.
//  Copyright © 2016 Petty Pet AS. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

enum Gender {
    case none
    case female
    case male
}

class Cat: Mappable {
    var breed: String?
    var gender: Gender?
    var age: Int?
    var city: String?
    var description: String?
    var photos: [UIImage]?

    required init?(map: Map) {
    }

    func mapping(map: Map) {
        breed <- map["breed"]
        gender <- map["gender"]
        age <- map["age"]
        city <- map["city"]
        description <- map["description"]

        let transform = TransformOf<[UIImage], [String]>(fromJSON: { (value: [String]?) -> [UIImage]? in
            // transform value from [String]? to [UIImage]?
            return value!.map { (imageName) in UIImage.init(named: imageName)! }
        }, toJSON: { (value: [UIImage]?) -> [String]? in
            // transform value from [UIImage]? to [String]?
            return nil
        })

        photos <- (map["photos"], transform)
    }
}
