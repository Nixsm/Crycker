//
//  MockCoinMarketCapRepository.swift
//  CryckerTests
//
//  Created by Nicholas Meschke on 2/25/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation
@testable import Crycker

class MockCoinMarketCapRepository: CoinMarketCapRepository {
    
    var shouldReturnSucces: Bool
    
    init(with shouldSucceed: Bool) {
        shouldReturnSucces = shouldSucceed
    }
    
    func fetchCryptoCoins(onSuccess: @escaping ([CryptoCoin]) -> Void, onFailure: ((String) -> Void)?) {
        if shouldReturnSucces {
            onSuccess([])
            return
        }
        
        onFailure?("")
    }
}
