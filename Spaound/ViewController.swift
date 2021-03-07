//
//  ViewController.swift
//  Spaound
//
//  Created by Saber on 07/03/2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StartCell", for: indexPath) as! StartCell
        if indexPath.row == 0 {
            cell.imageView.image = UIImage(named: "home1")
            cell.mainLabel.text =
                """
                You can find any
                place here
                """
            cell.secondaryLabel.text =
                """
                Good mood good place, let's go!
                Happy day with your favorite mood.
                """
            
        } else if indexPath.row == 1 {
            cell.imageView.image = UIImage(named: "home2")
            cell.mainLabel.text =
                """
                Find a place where
                you can study
                """
            cell.secondaryLabel.text =
                """
                It’ hard to find a quiet place to study
                Around allow you to see place reviews.
                """
        } else if indexPath.row == 2 {
            cell.imageView.image = UIImage(named: "home3")
            cell.mainLabel.text =
                """
                Save money when
                book with us
                """
            cell.secondaryLabel.text =
                """
                Save more money was never easy
                Around will make you a lot of offers.
                """
            cell.actionButton.setTitle("Getting Start ", for: .normal)
            cell.actionButton.backgroundColor = UIColor(
        }
        
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collectionView.frame.size
    }
    
    
}

