//
//  RegisterFormViewController.swift
//  Spaound
//
//  Created by Saber on 07/03/2021.
//

import UIKit
import Firebase

class RegisterFormViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        continueButton.layer.cornerRadius = 16
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        let homeVC = self.storyboard?.instantiateViewController(identifier: "Home") as! HomeViewController
        homeVC.modalPresentationStyle = .fullScreen
        self.present(homeVC, animated: true, completion: nil)
    }
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        guard let username = usernameTextField.text, let email = emailTextField.text, let phoneNumber = phoneTextField.text, let password = passwordTextField.text else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            guard let _ = error else{
                preconditionFailure("error with tha auth fn in the database")
            }
                guard let userID = result?.user.uid else {
                    return
                    
                }
                let refrence = Database.database().reference()
                let user = refrence.child("Users").child(userID)
                let dataDict : [String: Any] = ["username": username, "phoneNumber": phoneNumber]
                user.setValue(dataDict)
                
            
        }
        
        
        let verfiyPhoneVC = self.storyboard?.instantiateViewController(identifier: "VerifyPhoneForm") as! VerifyPhoneViewController
        
        verfiyPhoneVC.modalPresentationStyle = .fullScreen
        self.present(verfiyPhoneVC, animated: true, completion: nil)
    }
}
