//
//  CoinDetailViewController.swift
//  Crycker
//
//  Created by Nicholas Meschke on 2/25/18.
//Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation
import UIKit

class CoinDetailViewController: UIViewController, StoryboardLoadable {

    // MARK: Properties

    var presenter: CoinDetailPresentation?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CoinDetailViewController: CoinDetailView {
    // TODO: implement view output methods
}
