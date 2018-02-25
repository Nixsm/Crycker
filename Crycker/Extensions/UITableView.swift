//
//  UITableView.swift
//  Crycker
//
//  Created by Nicholas Meschke on 2/24/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func register<T>(_ type: T.Type) where T: UITableViewCell, T: NibLoadable, T:ReusableView {
        let nib = UINib.init(nibName: T.nibName(), bundle: nil)
        self.register(nib, forCellReuseIdentifier: T.reuseIdentifier())
    }
    
    func dequeueReusable<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier(), for: indexPath) as? T else {
            fatalError("Couldn't dequeue cell with identifier: \(T.reuseIdentifier()).")
        }
        
        return cell
    }
    
}
