//
//  SplashViewController.swift
//  Spaound
//
//  Created by Saber on 23/03/2021.
//

import UIKit

class SplashViewController: UIViewController {
    
    private let imageView : UIImageView = {
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 69))
        imageView.image = UIImage(named: "logo")
        return imageView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageView.center = view.center
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute:{
            self.animate()
        })
    }
    
    private func animate(){
        UIView.animate(withDuration: 1) {
            let size = self.view.frame.size.width * 3
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            
            self.imageView.frame = CGRect(x: -(diffX/2),
                                          y: diffY/2,
                                          width: size,
                                          height: size)
            self.imageView.alpha = 0
        }completion: { (done) in
            if done{
                if let homeVC = self.storyboard?.instantiateViewController(identifier: "HomeNV"){
                homeVC.modalTransitionStyle = .crossDissolve
                homeVC.modalPresentationStyle = .fullScreen
                self.present(homeVC, animated: true, completion: nil)
            }
        }
    }
    }


}
