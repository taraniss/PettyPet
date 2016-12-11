//
//  ViewController.swift
//  PettyPet
//
//  Created by Pinar Olguc on 11/12/2016.
//  Copyright © 2016 Petty Pet AS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return records().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "catcell", for: indexPath) as! ImagedCatCell
        cell.update(record: records()[indexPath.row])
        return cell
    }
    
    func records() -> [Record] {
        var result: [Record] = []
        
        for i in 1...10 {
            let imageName = "kittybab" + "\(i)"
            let cat = Cat(breed: "Scottish " + "\(i)", gender: .male, age: 1, city: "Istanbul", description: "cok guzel", photos: [UIImage.init(named: imageName)!])
            let owner = RecordOwner(name: "pinar", surname: "olguc", phone: "02342343213")
            let record = Record(cat: cat, date: Date(), redordId: 123, status: .active, owner: owner, price: 12.5)
            result.append(record)
        }
        
        return result
    }
}
