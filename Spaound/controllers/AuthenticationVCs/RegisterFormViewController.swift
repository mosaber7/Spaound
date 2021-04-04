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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        applyCornerRadius()
        
    }
    
    
    func applyCornerRadius(){
        continueButton.layer.cornerRadius = 16
        usernameContainer.layer.cornerRadius = 16
        emailContainer.layer.cornerRadius = 16
        phoneContainer.layer.cornerRadius = 16
        passwordContainer.layer.cornerRadius = 16
    }
    
    func startSpinner(){
        continueButton.isHidden = true
        continueButton.isUserInteractionEnabled = false
        spinner.isHidden = false
        spinner.startAnimating()
        
    }
    
    
    func createUser(email: String, password: String, username: String, phoneNumber: String){
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                self.continueButton.isHidden = false
                self.continueButton.isUserInteractionEnabled = true
                self.spinner.isHidden = true
                self.spinner.stopAnimating()
                
                print("error in the regrestration fn: \(error)")
                
            }
            guard let userID = result?.user.uid else {
                return
                
            }
            let refrence = Database.database().reference()
            let user = refrence.child("Users").child(userID)
            let dataDict : [String: Any] = ["username": username, "phoneNumber": phoneNumber]
            user.setValue(dataDict)
            
            
        }
        
    }
    
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        
        
        guard let username = usernameTextField.text,username != "", let email = emailTextField.text, email != "", let phoneNumber = phoneTextField.text, phoneNumber != "", let password = passwordTextField.text, password != "" else {
            showAlert(message: "please fill out all the fields")
            return
        }
        if !isValidEmailAddress(emailAddressString: email){
            showAlert(message: "please insert a valid mail form: mo@example.com")
        }
        
        startSpinner()
        createUser(email: email, password: password, username: username, phoneNumber: phoneNumber)
        
        
        guard let verfiyPhoneVC = self.storyboard?.instantiateViewController(identifier: "VerifyPhoneForm") as? VerifyPhoneViewController else{
            fatalError("Can't find VerifyPhoneForm")
        }
        
        navigationController?.pushViewController(verfiyPhoneVC, animated: true)
        
    }
    
    
    
    
    
    
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

extension RegisterFormViewController{
    
    func showAlert(message: String){
        
        let alert = UIAlertController(title: "Notification", message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        
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
