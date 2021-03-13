//
//  UICollectionView+Extinsion.swift
//  Spaound
//
//  Created by Saber on 11/03/2021.
//

import Foundation

import UIKit

extension UICollectionView{
    
    func dequeue<Cell: UICollectionViewCell>(indexPath: IndexPath) -> Cell {
        let identifier = String(describing: Cell.self)
        
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Cell else {
            preconditionFailure("unexpecteted cell identifiew")
        }
        
        return cell
    }
    
    func registerNib<Cell: UICollectionViewCell>(cell: Cell.Type) {
        
        let nibName = String(describing: Cell.self)
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
        
    }
}
