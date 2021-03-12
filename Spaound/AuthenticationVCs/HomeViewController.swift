//
//  HomeViewController.swift
//  Spaound
//
//  Created by Saber on 07/03/2021.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var registerLabel: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.registerTapped(_:)))
        registerLabel.isUserInteractionEnabled = true
        registerLabel.addGestureRecognizer(tap)
            }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        loginButton.layer.cornerRadius = 16
    }
    
    
    @IBAction func loginTapped(_ sender: Any) {
        let loginFormVC = self.storyboard?.instantiateViewController(identifier: "LoginForm") as! LoginFormViewController
        loginFormVC.modalPresentationStyle = .fullScreen
        
        self.present(loginFormVC, animated: true, completion: nil)
        
        
        
    }
    
    @objc func registerTapped(_ sender: UITapGestureRecognizer){
        let registerVC = self.storyboard?.instantiateViewController(identifier: "RegisterForm") as! RegisterFormViewController
    
        registerVC.modalPresentationStyle = .fullScreen
        self.present(registerVC, animated: true, completion: nil)
        
    }
    
    
    
    
}
