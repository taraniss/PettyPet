//
//  ViewController.swift
//  PettyPet
//
//  Created by Pinar Olguc on 11/12/2016.
//  Copyright © 2016 Petty Pet AS. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!

    var records: [Record] = [];

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let refreshControl = UIRefreshControl()
        refreshControl.backgroundColor = UIColor.white
        refreshControl.tintColor = UIColor.red
        refreshControl.addTarget(self, action: #selector(self.fetchRecords), for: .valueChanged)
        
        collectionView.refreshControl = refreshControl
        
        self.fetchRecords()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return records.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "catcell", for: indexPath) as! ImagedCatCell
        cell.update(record: records[indexPath.row])
        return cell
    }
    
    func fetchRecords() {
        self.records = [];
        let URL = "http://localhost:5000/cats"
        Alamofire.request(URL).responseObject { [weak self] (dataResponse: DataResponse<CatsResponse>)  in
            guard let response = dataResponse.result.value,
                let strongSelf = self else {
                    return
            }
            if response.success {
                print("Got data:")
                print(response.data!)
                for record in response.data! {
                    strongSelf.records.append(record)
                }
                strongSelf.collectionView.refreshControl?.endRefreshing()
                strongSelf.collectionView.reloadData()
            } else {
                print("Failed")
            }
        }
    }
}
