//
//  HomeViewController.swift
//  Spaound
//
//  Created by Saber on 07/03/2021.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var registerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.registerTapped(_:)))
                registerLabel.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }

    @IBAction func loginTapped(_ sender: Any) {
        print("presssssedd")
    }
    
    @objc func registerTapped(_ sender: UITapGestureRecognizer){
        print("here")
    }

    
}