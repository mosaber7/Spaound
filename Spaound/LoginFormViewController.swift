//
//  LoginFormViewController.swift
//  Spaound
//
//  Created by Saber on 07/03/2021.
//

import UIKit

class LoginFormViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        let homeVC = self.storyboard?.instantiateViewController(identifier: "Home") as! HomeViewController
        
        homeVC.modalPresentationStyle = .fullScreen
        self.present(homeVC, animated: true, completion: nil)
    }
    
}
