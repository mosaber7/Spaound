//
//  PopularSpacesViewController.swift
//  Spaound
//
//  Created by Saber on 13/03/2021.
//

import UIKit

class PopularSpacesViewController: UIViewController {
    
    var spaces : [Space]!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(cell: PopularSpacesTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        

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
        cell.Config()
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = self.storyboard?.instantiateViewController(identifier: "Details") as? DetailsViewController else{
            fatalError("Can't find Details")
        }
        detailVC.space = spaces[indexPath.row]
        detailVC.modalPresentationStyle = .fullScreen
        present(detailVC, animated: true, completion: nil)
    }
    
    
}
