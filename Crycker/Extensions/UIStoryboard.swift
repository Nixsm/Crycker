//
//  UIStoryboard.swift
//  Crycker
//
//  Created by Nicholas Meschke on 2/25/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    static func loadViewController<T>() -> T where T: StoryboardLoadable, T: UIViewController {
        // swiftlint:disable:next force_cast
        return UIStoryboard(name: T.storyboardName(), bundle: nil).instantiateViewController(withIdentifier: T.storyboardIdentifier()) as! T
    }
}
