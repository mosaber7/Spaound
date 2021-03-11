//
//  RestorePasswordViewController.swift
//  Spaound
//
//  Created by Saber on 08/03/2021.
//

import UIKit

class RestorePasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        let loginVC = self.storyboard?.instantiateViewController(identifier: "LoginForm") as! LoginFormViewController
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true, completion: nil)
    }


}
