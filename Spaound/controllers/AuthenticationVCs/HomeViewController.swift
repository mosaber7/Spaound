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
        registerLabel.textColor = UIColor(named: "mainLabelColor")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.registerTapped(_:)))
        registerLabel.isUserInteractionEnabled = true
        registerLabel.addGestureRecognizer(tap)
            }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        loginButton.layer.cornerRadius = 16
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if Core.shared.isNewUser(){
        //show Onboarding
            let welecomeVC = storyboard?.instantiateViewController(identifier: "Onboard")
            welecomeVC?.modalPresentationStyle = .fullScreen
           present(welecomeVC!, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func loginTapped(_ sender: Any) {
        guard let loginFormVC = self.storyboard?.instantiateViewController(identifier: "LoginForm") as? LoginFormViewController else{
            fatalError("Can't find LoginForm")
        }
        
        navigationController?.pushViewController(loginFormVC, animated: true)
        
        
        
    }
    
    @objc func registerTapped(_ sender: UITapGestureRecognizer){
        guard let registerVC = self.storyboard?.instantiateViewController(identifier: "RegisterForm") as? RegisterFormViewController else{
            fatalError("Can't find RegisterForm")
        }
    
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
}


class Core{
    
    static let shared = Core()
    
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    func setIsNotNewUser(){
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
    
}
