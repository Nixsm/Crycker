//
//  ReusableView.swift
//  Crycker
//
//  Created by Nicholas Meschke on 2/24/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation

protocol ReusableView: class {
    static func reuseIdentifier() -> String
}

extension ReusableView {
    static func reuseIdentifier() -> String {
        return String(describing: Self.self)
    }
}
