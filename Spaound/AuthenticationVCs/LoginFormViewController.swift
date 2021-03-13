//
//  LoginFormViewController.swift
//  Spaound
//
//  Created by Saber on 07/03/2021.
//

import UIKit
import Firebase

class LoginFormViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var resetPasswordLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(resetPasswordTapped(_:)))
        resetPasswordLabel.isUserInteractionEnabled = true
        resetPasswordLabel.addGestureRecognizer(tap)
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        loginButton.layer.cornerRadius = 16
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        
    navigationController?.popViewController(animated: true)
    }
    
    @objc func resetPasswordTapped(_ sender: UITapGestureRecognizer){
        
        let verfiyPassVC = self.storyboard?.instantiateViewController(identifier: "RestorePasswordForm") as! RestorePasswordViewController
        verfiyPassVC.modalPresentationStyle = .fullScreen
        
        self.present(verfiyPassVC, animated: true, completion: nil)
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error == nil{
                print("success")
            }else{
                self.showAlert(message: "something is Wrong")
                
            }
        }
        
        
    }
    
    func showAlert(message: String){
        
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        
    }
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

//handling the keyboard extension

extension LoginFormViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
    }
}
