//
//  MockMainView.swift
//  CryckerTests
//
//  Created by Nicholas Meschke on 2/25/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation
@testable import Crycker

class MockMainView: MainView {

    var fetchedCoins = false
    var didShowErrorDialog = false
    
    func showCoins(with coins: [CryptoCoin]) {
        fetchedCoins = true
    }
    
    func showErrorDialog(with text: String, title: String) {
        didShowErrorDialog = true
    }
}
