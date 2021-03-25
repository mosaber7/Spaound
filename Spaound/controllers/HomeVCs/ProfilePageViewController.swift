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
    
        
    }
      
    




