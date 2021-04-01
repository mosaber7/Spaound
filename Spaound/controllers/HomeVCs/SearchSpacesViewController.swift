//
//  FindSpacesViewController.swift
//  Spaound
//
//  Created by Saber on 13/03/2021.
//

import UIKit
import Alamofire

class SearchSpacesViewController: UIViewController, UISearchBarDelegate {
    
    var spaces = [Space]()
    var filteredSpaces: [Space]!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredSpaces = spaces
        
        tableView.registerNib(cell: PopularSpacesTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        
        fetchSpaces()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
    }
    
    func fetchSpaces(){
        WebServices.shared.getJson { (result) in
            switch result{
            
            case .success(let spaces):
                self.spaces = spaces
            case .failure(let error):
                print(error)
            }
        }
        
    }
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)

    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        tableView.isHidden = false
        imageView.isHidden = true
        label.isHidden = true
        
        filteredSpaces = []
        if searchText == ""{
            filteredSpaces = spaces
            tableView.isHidden = true
            imageView.isHidden = false
            label.isHidden = false
        }else{
        
        for space in spaces{
            if space.name.lowercased().contains(searchText.lowercased()){
                print("Space Name: \(space.name)")
                filteredSpaces.append(space)
            }
        }
        
        tableView.reloadData()
    }
    
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    
    
    
}


// MARK: tableView Config extension
extension SearchSpacesViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredSpaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let space = filteredSpaces[indexPath.row]
        let cell = tableView.dequeue() as PopularSpacesTableViewCell
        cell.space = space
        cell.Config()
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("here")
        guard let detailVC = self.storyboard?.instantiateViewController(identifier: "Details") as? DetailsViewController else{
            fatalError("can't find DEtails cell")
        }
        detailVC.space = filteredSpaces[indexPath.row]
        detailVC.modalPresentationStyle = .fullScreen
        self.present(detailVC, animated: true, completion: nil)
    }
    
    
}
