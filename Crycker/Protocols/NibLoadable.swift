//
//  NibLoadable.swift
//  Crycker
//
//  Created by Nicholas Meschke on 2/24/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation
import UIKit

protocol NibLoadable: class {
    static func nibName() -> String
}

extension NibLoadable {
    static func nibName() -> String {
        return String(describing: Self.self)
    }
}

extension NibLoadable where Self: UIView {
    
    func loadFromNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: Self.nibName(), bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.frame = self.bounds
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        self.addSubview(view)
    }
    
}
