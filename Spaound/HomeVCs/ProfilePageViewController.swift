//
//  ProfilePageViewController.swift
//  Spaound
//
//  Created by Saber on 12/03/2021.
//

import UIKit

class ProfilePageViewController: UIViewController {
    var spaces: [Space] = []

    @IBOutlet weak var profaileImageView: UIImageView!
    @IBOutlet weak var signOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.changeProfuleImage(_:)))
        profaileImageView.isUserInteractionEnabled = true
        profaileImageView.addGestureRecognizer(tap)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        signOutButton.layer.cornerRadius = 16
    }
    
    @objc func changeProfuleImage(_ sender: UITapGestureRecognizer){
        let alert = UIAlertController(title: "here", message: "Hola", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    

    @IBAction func signOutTapped(_ sender: Any) {
     //   getJson()
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



