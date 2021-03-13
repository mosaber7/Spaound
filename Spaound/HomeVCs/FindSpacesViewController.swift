//
//  FindSpacesViewController.swift
//  Spaound
//
//  Created by Saber on 13/03/2021.
//

import UIKit

class FindSpacesViewController: UIViewController {

    @IBOutlet weak var searchBarContainerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBarTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(cell: PopularSpacesTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        searchBarTextField.delegate = self
    }
    override func viewWillLayoutSubviews() {
        searchBarContainerView.layer.cornerRadius = 16
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    

}

extension FindSpacesViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        tableView.isHidden = false
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension FindSpacesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as PopularSpacesTableViewCell
        return cell
        
    }
    
    
}
