//
//  UITableView+Extinsion.swift
//  Spaound
//
//  Created by Saber on 11/03/2021.
//

import Foundation
import UIKit

extension UITableView{
    
    func dequeue<Cell: UITableViewCell>() -> Cell {
        let identifier = String(describing: Cell.self)
        
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? Cell else {
            preconditionFailure("unexpecteted cell identifiew")
        }
        
        return cell
    }
}
