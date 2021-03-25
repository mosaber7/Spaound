//
//  PopularSpacesViewController.swift
//  Spaound
//
//  Created by Saber on 13/03/2021.
//

import UIKit

class PopularSpacesViewController: UIViewController {
    
    var spaces = [Space]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        tableView.registerNib(cell: PopularSpacesTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        fetchSpaces()
        

    }
    
    
    func fetchSpaces(){
        WebServices.getJson { (spaces, error) in
            if let error = error{
                print(error)
                return
            }
            self.spaces = spaces!
            self.tableView.reloadData()
            
        }
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

extension PopularSpacesViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        spaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let space = spaces[indexPath.row]
        let cell = tableView.dequeue() as PopularSpacesTableViewCell
        cell.space = space
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(identifier: "Details")
        detailVC?.modalPresentationStyle = .fullScreen
        present(detailVC!, animated: true, completion: nil)
    }
    
    
}
