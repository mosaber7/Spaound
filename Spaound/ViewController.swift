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
            
            cell.mainImageView.image = UIImage(named: "home1")
            cell.sliderImageView.image = UIImage(named: "sliderPage1")
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
            cell.actionButton.addTarget(self, action: #selector(scrollToSecondPage(_:)), for: .touchUpInside)
            
            
            
        } else if indexPath.row == 1 {
            
            cell.mainImageView.image = UIImage(named: "home2")
            cell.sliderImageView.image = UIImage(named: "sliderPage2")
            
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
            cell.actionButton.addTarget(self, action: #selector(scrollToThirdPage(_:)), for: .touchUpInside)

        } else if indexPath.row == 2 {
            
            cell.mainImageView.image = UIImage(named: "home3")
            cell.sliderImageView.image = UIImage(named: "sliderPage3")
            
            cell.mainLabel.text =
                """
                Save money when you
                book with us
                """
            cell.secondaryLabel.text =
                """
                Save more money was never easy
                Around will make you a lot of offers.
                """
            cell.actionButton.layer.cornerRadius = 27.5
            cell.actionButton.backgroundColor = UIColor(named: "actionButtonColor")
            cell.actionButton.setTitle("Getting Start ", for: .normal)
            cell.actionButton.setTitleColor(UIColor(named: "actionButtonColorReversed"), for: .normal )

        }
        
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collectionView.frame.size
    }
    
    @objc func scrollToSecondPage(_ sender: UIButton){
        
        collectionView.scrollToItem(at: IndexPath(row: 1, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    @objc func scrollToThirdPage(_ sender: UIButton){
        
        collectionView.scrollToItem(at: IndexPath(row: 2, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    
}

