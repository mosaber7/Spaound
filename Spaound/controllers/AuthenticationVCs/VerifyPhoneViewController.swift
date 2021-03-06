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
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        let alert = UIAlertController(title: "account Created Successfully", message: nil, preferredStyle: .alert)
        let dismissaction = UIAlertAction(title: "Dismiss", style: .default, handler: { (UIAlertAction) in
            
            guard let loginVC = self.storyboard?.instantiateViewController(identifier: "LoginForm") as? LoginFormViewController else{
                fatalError("Can't find LoginForm")
            }
            
            self.navigationController?.pushViewController(loginVC, animated: true)
        })
        alert.addAction(dismissaction)
        self.present(alert, animated: true, completion: nil)
      
        
    }
    
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
}

extension VerifyPhoneViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
    }
}

