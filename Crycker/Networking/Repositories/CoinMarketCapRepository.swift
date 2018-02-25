//
//  CoinMarketCapRepository.swift
//  Crycker
//
//  Created by Nicholas Meschke on 2/23/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation

protocol CoinMarketCapRepository: class {
    func fetchCryptoCoins(onSuccess: @escaping ([CryptoCoin]) -> Void, onFailure: ((String) -> Void)?)
}
