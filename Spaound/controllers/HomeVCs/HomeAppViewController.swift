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
    
    var spaces = [Space]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rcmndedSpcsCollectionView.delegate = self
        rcmndedSpcsCollectionView.dataSource = self
        rcmndedSpcsCollectionView.registerNib(cell: RecomndedSpacesCollectionViewCell.self)
        
        popularSpacesTV.dataSource = self
        popularSpacesTV.delegate = self
        popularSpacesTV.registerNib(cell: PopularSpacesTableViewCell.self)
        
        
        fetchSpaces()
   
    }
    
    func fetchSpaces(){
        WebServices.getJson { (spaces, error) in
            if let error = error{
                print(error)
                return
            }
            self.spaces = spaces!
            self.popularSpacesTV.reloadData()
            self.rcmndedSpcsCollectionView.reloadData()
            
            
        }
    }
    
    
    
    
    @IBAction func seeAllTApped(_ sender: Any) {
        let popularSpacesVC = self.storyboard?.instantiateViewController(identifier: "PopularSpacesViewController") as! PopularSpacesViewController
        
        popularSpacesVC.modalPresentationStyle = .fullScreen
        self.present(popularSpacesVC, animated: true, completion: nil)
        
    }
    
}



//CollectionView extension
extension HomeAppViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        spaces.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let space = spaces[indexPath.row]
        
        let cell = rcmndedSpcsCollectionView.dequeue(indexPath: indexPath) as RecomndedSpacesCollectionViewCell
        cell.space = space
        
        return cell
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return rcmndedSpcsCollectionView.frame.size
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(identifier: "Details")
        detailVC?.modalPresentationStyle = .fullScreen
        present(detailVC!, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
}

// tableView extension
extension HomeAppViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        spaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let space = spaces[indexPath.row]
        let cell = popularSpacesTV.dequeue() as PopularSpacesTableViewCell
        cell.space = space
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(identifier: "Details")
        detailVC?.modalPresentationStyle = .fullScreen
        present(detailVC!, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        false
    }
    
}




