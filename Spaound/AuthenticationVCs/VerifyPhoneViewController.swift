//
//  VerifyPhoneViewController.swift
//  Spaound
//
//  Created by Saber on 07/03/2021.
//

import UIKit

class VerifyPhoneViewController: UIViewController {
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        createAccountButton.layer.cornerRadius = 16
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        let registerVC = self.storyboard?.instantiateViewController(identifier: "RegisterForm") as! HomeViewController
        registerVC.modalPresentationStyle = .fullScreen
        self.present(registerVC, animated: true, completion: nil)
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
    }
    
    
}
