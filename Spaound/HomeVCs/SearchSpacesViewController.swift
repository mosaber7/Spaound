//
//  FindSpacesViewController.swift
//  Spaound
//
//  Created by Saber on 13/03/2021.
//

import UIKit
import Alamofire

class SearchSpacesViewController: UIViewController {
    
    var spaces = [Space]()
    
    @IBOutlet weak var searchBarContainerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBarTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tableView.registerNib(cell: PopularSpacesTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        searchBarTextField.delegate = self
        
        makeRequest()
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
    
    
    func makeRequest(){
        Alamofire.request("http://localhost:3000/spaces/").validate(statusCode: 200 ..< 300)
            .responseJSON { (responce) in
                
                switch responce.result{
                case .success(_):
                    do {
                        self.spaces = try  JSONDecoder().decode([Space].self, from: responce.data!)
                        print(self.spaces)
                    } catch {
                        print("errror decoding json data")
                    }
                    
                case .failure(let error):
                    print(error)
                    
                    
                }
                
                
            }
        
    }
    
}

extension SearchSpacesViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        tableView.isHidden = false
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension SearchSpacesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as PopularSpacesTableViewCell
        return cell
        
    }
    
    
}
