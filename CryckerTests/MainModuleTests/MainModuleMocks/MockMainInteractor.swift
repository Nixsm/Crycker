//
//  MockMainInteractor.swift
//  CryckerTests
//
//  Created by Nicholas Meschke on 2/25/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation
@testable import Crycker

class MockMainInteractor: MainUseCase {
    
    var output: MainInteractorOutput?
    
    var fetchedCrytoCoins = false
    var shouldCallSuccess = true
    
    func fetchCryptoCoins() {
        fetchedCrytoCoins = true
        if shouldCallSuccess {
            output?.onFetchCryptoCoinsSuccess(with: [])
        } else {
            output?.onFetchCryptoCoinsFailure(with: "")
        }
    }
}
