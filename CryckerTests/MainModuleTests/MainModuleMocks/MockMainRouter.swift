//
//  MockMainRouter.swift
//  CryckerTests
//
//  Created by Nicholas Meschke on 2/25/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation
@testable import Crycker

class MockMainRouter: MainWireFrame {
    var calledOpenCoinDetail = false

    func openCoinDetail(for coin: CryptoCoin) {
        calledOpenCoinDetail = true
    }
}
