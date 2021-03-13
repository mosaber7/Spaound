//
//  ProfilePageViewController.swift
//  Spaound
//
//  Created by Saber on 12/03/2021.
//

import UIKit

class ProfilePageViewController: UIViewController {
    var spaces: [Space] = []

    @IBOutlet weak var signOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        signOutButton.layer.cornerRadius = 16
    }
    

    @IBAction func signOutTapped(_ sender: Any) {
        getJson()
    }
    func getJson(){
        let url = URL(string: "http://localhost:3000/spaces/")!
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, responce, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else{
                print("data -> nil")
                return
            }
            print(data)
            let decoder = JSONDecoder()
            guard let spacesData = try? decoder.decode([Space].self, from: data) else {
                print(error)
                return
            }
            
            self.spaces = spacesData
            for space in self.spaces{
                print("space name:\(space.name)")
                
            }
            
        }.resume()
        
    }
      
    
}



