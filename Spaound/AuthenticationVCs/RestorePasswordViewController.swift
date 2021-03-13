//
//  RestorePasswordViewController.swift
//  Spaound
//
//  Created by Saber on 08/03/2021.
//

import UIKit

class RestorePasswordViewController: UIViewController {

    @IBOutlet weak var resetPasswordButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        resetPasswordButton.layer.cornerRadius = 16
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }

@IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
    view.endEditing(true)
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
