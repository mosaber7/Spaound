//
//  ProfilePageViewController.swift
//  Spaound
//
//  Created by Saber on 12/03/2021.
//

import UIKit
import Firebase

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
        showAlert(message: "Are you sure you want to log out?")
       
    }
    
        
    }

extension ProfilePageViewController{
    func showAlert(message: String){
        
        let alert = UIAlertController(title: "Notification", message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        let logoutAction = UIAlertAction(title: "Log out", style: .default) { (UIAlertAction) in
            try? Auth.auth().signOut()
            print(Auth.auth().currentUser ?? "no user")
            
            let homeVC = self.storyboard?.instantiateViewController(identifier: "HomeNV")
            homeVC?.modalTransitionStyle = .crossDissolve
            homeVC?.modalPresentationStyle = .fullScreen
            self.present(homeVC!, animated: true, completion: nil)

        }
        
        alert.addAction(cancelAction)
        alert.addAction(logoutAction)
        present(alert, animated: true) {
        }
    
    }
    
}
      
    




