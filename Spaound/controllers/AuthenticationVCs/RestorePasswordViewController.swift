//
//  RestorePasswordViewController.swift
//  Spaound
//
//  Created by Saber on 08/03/2021.
//

import UIKit

class RestorePasswordViewController: UIViewController {

    @IBOutlet weak var resetPasswordButton: UIButton!
    @IBOutlet weak var emailContainer: UIStackView!
    @IBOutlet weak var emailTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        resetPasswordButton.layer.cornerRadius = 16
        emailContainer.layer.cornerRadius = 16
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }

@IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
    view.endEditing(true)
}
    
    
    @IBAction func resetPasswordTapped(_ sender: Any) {
        guard let email = emailTF.text, email != "" else {
            let alert = UIAlertController(title: "Notifaction", message: "Please make sure you wite your email correctly", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
            return
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}

extension RestorePasswordViewController: UITextFieldDelegate{

func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
}

override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    view.endEditing(true)
}
}
