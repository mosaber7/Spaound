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
        let loginVC = self.storyboard?.instantiateViewController(identifier: "LoginForm") as! LoginFormViewController
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true, completion: nil)
    }


}
