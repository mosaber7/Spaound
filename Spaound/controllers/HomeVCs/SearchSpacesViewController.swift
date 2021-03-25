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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredSpaces = spaces
        
        tableView.registerNib(cell: PopularSpacesTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        
   //     makeRequest()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
    }
    
   
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredSpaces = []
        if searchText == ""{
            filteredSpaces = spaces
        }
        
        for space in spaces{
            if space.name.lowercased().contains(searchText.lowercased()){
                filteredSpaces.append(space)
            }
        }
        
        tableView.reloadData()
    }
    
    
    
    
    
}


// MARK: tableView Config extension
extension SearchSpacesViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as PopularSpacesTableViewCell
        return cell
        
    }
    
    
}
