//
//  Cat.swift
//  PettyPet
//
//  Created by Pinar Olguc on 11/12/2016.
//  Copyright © 2016 Petty Pet AS. All rights reserved.
//

import Foundation
import UIKit

enum Gender {
    case none
    case female
    case male
}

struct Cat {
    let breed: String
    let gender: Gender
    let age: Int
    let city: String
    let description: String
    let photos: [UIImage]
}
