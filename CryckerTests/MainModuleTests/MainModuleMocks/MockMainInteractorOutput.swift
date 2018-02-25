//
//  MockMainInteractorOutput.swift
//  CryckerTests
//
//  Created by Nicholas Meschke on 2/25/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation
@testable import Crycker

class MockMainInteractorOutput: MainInteractorOutput {
    
    var succeeded: Bool?
    
    func onFetchCryptoCoinsFailure(with error: String) {
        succeeded = false
    }
    
    func onFetchCryptoCoinsSuccess(with cryptos: [CryptoCoin]) {
        succeeded = true
    }
}
