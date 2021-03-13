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
    
    var spaces: [Space] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rcmndedSpcsCollectionView.delegate = self
        rcmndedSpcsCollectionView.dataSource = self
        
        rcmndedSpcsCollectionView.registerNib(cell: RecomndedSpacesCollectionViewCell.self)
        
        popularSpacesTV.dataSource = self
        popularSpacesTV.delegate = self
        
        popularSpacesTV.registerNib(cell: PopularSpacesTableViewCell.self)
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        
    }
    
    func getJson(){
        let url = URL(string: "http://localhost:3000/spaces/")!
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, responce, error) in
            guard let _ = error else{
                
                print("error in the network")
                return
            }
            
            guard let data = data else{
                print("data -> nil")
                return
            }
            
            let decoder = JSONDecoder()
            self.spaces = try! decoder.decode([Space].self, from: data)
            for space in self.spaces{
                print("space name:\(space.name)")
                
            }
            
        }.resume()
        
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
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let cell = rcmndedSpcsCollectionView.dequeue(indexPath: indexPath) as RecomndedSpacesCollectionViewCell
        
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
        
        let cell = popularSpacesTV.dequeue() as PopularSpacesTableViewCell
        
        return cell
    }
    
}


