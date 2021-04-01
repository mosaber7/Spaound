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
    
    @IBOutlet weak var emailSVContainer: UIStackView!
    @IBOutlet weak var passwordSVContainer: UIStackView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetPasswordLabel.textColor = UIColor(named: "mainLabelColor")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(resetPasswordTapped(_:)))
        resetPasswordLabel.isUserInteractionEnabled = true
        resetPasswordLabel.addGestureRecognizer(tap)
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        loginButton.layer.cornerRadius = 16
        passwordSVContainer.layer.cornerRadius = 16
        emailSVContainer.layer.cornerRadius = 16
    }
    
    
    
    
    
    @objc func resetPasswordTapped(_ sender: UITapGestureRecognizer){
        
        guard let verfiyPassVC = self.storyboard?.instantiateViewController(identifier: "RestorePasswordForm") as? RestorePasswordViewController else{
            fatalError("Cant find RestorePasswordForm")
        }
        verfiyPassVC.modalPresentationStyle = .fullScreen
        
        self.present(verfiyPassVC, animated: true, completion: nil)
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func loginTapped(_ sender: Any) {
       
        guard let email = emailTextField.text, email != "", let password = passwordTextField.text, password != "" else {
            showAlert(message: "please fill out all the fields")
            return
        }
        if !isValidEmailAddress(emailAddressString: email){
            showAlert(message: "please insert a valid mail form: mo@example.com")
        }
        loginButton.isHidden = true
        loginButton.isUserInteractionEnabled = false
        spinner.isHidden = false
        spinner.startAnimating()
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error == nil{
                let homeAppVC = self.storyboard?.instantiateViewController(identifier: "Home")
                homeAppVC?.modalTransitionStyle = .crossDissolve
                homeAppVC?.modalPresentationStyle = .fullScreen
                self.present(homeAppVC!, animated: true, completion: nil)
            }else{
                self.showAlert(message: "please recheck your data")
                self.loginButton.isHidden = false
                self.loginButton.isUserInteractionEnabled = true
                self.spinner.isHidden = true
                self.spinner.stopAnimating()
                
            }
        }
        
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


extension LoginFormViewController{
    func showAlert(message: String){
        
        let alert = UIAlertController(title: "Notification", message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true) {
            self.passwordTextField.text = ""
        }
        
    }
    func isValidEmailAddress(emailAddressString: String) -> Bool {
      
      var returnValue = true
      let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
      
      do {
          let regex = try NSRegularExpression(pattern: emailRegEx)
          let nsString = emailAddressString as NSString
          let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
          
          if results.count == 0
          {
              returnValue = false
          }
          
      } catch let error as NSError {
          print("invalid regex: \(error.localizedDescription)")
          returnValue = false
      }
      
      return  returnValue
  }
    
    
    
}
