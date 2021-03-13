//
//  PopularSpacesViewController.swift
//  Spaound
//
//  Created by Saber on 13/03/2021.
//

import UIKit

class PopularSpacesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        tableView.registerNib(cell: PopularSpacesTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension PopularSpacesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as PopularSpacesTableViewCell
        
        return cell
    }
    
    
    
}
