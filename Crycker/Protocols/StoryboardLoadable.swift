//
//  StoryboardLoadable.swift
//  Crycker
//
//  Created by Nicholas Meschke on 2/25/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation
import UIKit

protocol StoryboardLoadable {
    static func storyboardName() -> String
    static func storyboardIdentifier() -> String
}

extension StoryboardLoadable where Self: UIViewController {
    static func storyboardName() -> String {
        return String(describing: Self.self).replacingOccurrences(of: "ViewController", with: "")
    }
    
    static func storyboardIdentifier() -> String {
        return String(describing: Self.self)
    }
}
