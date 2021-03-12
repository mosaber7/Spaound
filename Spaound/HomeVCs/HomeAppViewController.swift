//
//  HomeAppViewController.swift
//  Spaound
//
//  Created by Saber on 11/03/2021.
//

import UIKit

class HomeAppViewController: UIViewController{
    
    @IBOutlet weak var rcmndedSpcsCollectionView: UICollectionView!
    
    @IBOutlet weak var popularSpacesTV: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rcmndedSpcsCollectionView.delegate = self
        rcmndedSpcsCollectionView.dataSource = self
        rcmndedSpcsCollectionView.register(UINib(nibName: "RecomndedSpacesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RecomndedSpacesCollectionViewCell")
        popularSpacesTV.dataSource = self
        popularSpacesTV.delegate = self
        popularSpacesTV.register(UINib(nibName: "PopularSpacesTableViewCell", bundle: nil), forCellReuseIdentifier: "PopularSpacesTableViewCell")
    }
      
    
}



//CollectionView extension
extension HomeAppViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
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

// tableView extension
extension HomeAppViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = popularSpacesTV.dequeueReusableCell(withIdentifier: "PopularSpacesTableViewCell") as! PopularSpacesTableViewCell
        return cell
    }
    
}


