//
//  HomeAppViewController.swift
//  Spaound
//
//  Created by Saber on 11/03/2021.
//

import UIKit

class HomeAppViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var rcmndedSpcsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rcmndedSpcsCollectionView.delegate = self
        rcmndedSpcsCollectionView.dataSource = self
        rcmndedSpcsCollectionView.register(UINib(nibName: "RecomndedSpacesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RecomndedSpacesCollectionViewCell")

    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = rcmndedSpcsCollectionView.dequeueReusableCell(withReuseIdentifier: "RecomndedSpacesCollectionViewCell", for: indexPath)
        
        return cell
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return rcmndedSpcsCollectionView.frame.size 
    }
    
    
}
   

