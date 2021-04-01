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
        
        OperationQueue.main.addOperation{
            self.fetchSpaces()
            
        }
   
    }
    
    func fetchSpaces(){
        
        WebServices.shared.getJson { (result) in
            switch result{
            
            case .success(let spaces):
                self.spaces = spaces
                
            case .failure(let error):
                print(error)
            }
            self.popularSpacesTV.reloadData()
            self.rcmndedSpcsCollectionView.reloadData()
        }
            
            
            
            
        }
    
    
    
    
    @IBAction func seeAllTApped(_ sender: Any) {
        guard let popularSpacesVC = self.storyboard?.instantiateViewController(identifier: "PopularSpacesViewController") as? PopularSpacesViewController else{
            fatalError("Can't find PopularSpacesViewController ")
        }
        popularSpacesVC.spaces = spaces
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
        cell.Config()
        return cell
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return rcmndedSpcsCollectionView.frame.size
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let detailVC = self.storyboard?.instantiateViewController(identifier: "Details") as? DetailsViewController else{
            fatalError("Can't find Details")
        }
        detailVC.space = spaces[indexPath.row]
        detailVC.modalPresentationStyle = .fullScreen
        self.present(detailVC, animated: true, completion: nil)
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
        cell.Config()
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = self.storyboard?.instantiateViewController(identifier: "Details") as? DetailsViewController else{
            fatalError("Can't find Details")
        }
        detailVC.space = spaces[indexPath.row]
        detailVC.modalPresentationStyle = .fullScreen
        self.present(detailVC, animated: true, completion: nil)
    }
    
   
}




