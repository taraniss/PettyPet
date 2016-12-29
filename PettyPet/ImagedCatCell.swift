//
//  ImagedCatCell.swift
//  PettyPet
//
//  Created by Pinar Olguc on 11/12/2016.
//  Copyright © 2016 Petty Pet AS. All rights reserved.
//

import Foundation
import UIKit

class ImagedCatCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    func update(record: Record) {
        if record.cat!.photos!.count > 0 {
            imageView.image = record.cat!.photos![0]
        }
        priceLabel.text = record.priceText()
        typeLabel.text = record.cat!.breed
    }
}
