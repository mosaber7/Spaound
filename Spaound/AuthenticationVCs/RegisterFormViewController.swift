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
    @IBOutlet weak var usernameContainer: UIStackView!
    @IBOutlet weak var emailContainer: UIStackView!
    @IBOutlet weak var phoneContainer: UIStackView!
    @IBOutlet weak var passwordContainer: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        continueButton.layer.cornerRadius = 16
        usernameContainer.layer.cornerRadius = 16
        emailContainer.layer.cornerRadius = 16
        phoneContainer.layer.cornerRadius = 16
        passwordContainer.layer.cornerRadius = 16
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
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
        
        navigationController?.pushViewController(verfiyPhoneVC, animated: true)    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
}

extension RegisterFormViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
    }
}
