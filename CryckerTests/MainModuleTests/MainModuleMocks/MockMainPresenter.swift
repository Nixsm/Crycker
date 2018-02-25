//
//  MockMainPresenter.swift
//  CryckerTests
//
//  Created by Nicholas Meschke on 2/25/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation
@testable import Crycker

class MockMainPresenter: MainPresentation {
    
    var viewWillAppearCalled = false
    var onCoinSelectedCalled = false
    
    func onViewWillAppear() {
        viewWillAppearCalled = true
    }
    
    func onCoinSelected(with coin: CryptoCoin) {
        onCoinSelectedCalled = true
    }
}
