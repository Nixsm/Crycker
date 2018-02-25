//
//  CoinMarketCapApiRepository.swift
//  Crycker
//
//  Created by Nicholas Meschke on 2/23/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation

class CoinMarketCapApiRepository: CoinMarketCapRepository {
    fileprivate var defaultSession = URLSession.shared
    fileprivate var dataTask: URLSessionDataTask?
    
    fileprivate let crytoLimit = 10

    func fetchCryptoCoins(onSuccess: @escaping ([CryptoCoin]) -> Void, onFailure: ((String) -> Void)?) {
        guard let url = Endpoints.ticker(crytoLimit) else {
            onFailure?("Ops! An error has occurred. Try again later!")
            return
        }
        dataTask?.cancel()

        let request = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: Constants.Requests.defaultTimeout)

        dataTask = defaultSession.dataTask(with: request) { (data, httpResponse, error) in
            defer { self.dataTask = nil }
            
            guard
                let data = data,
                let response = httpResponse as? HTTPURLResponse,
                response.statusCode == 200,
                let coins = try? JSONDecoder().decode([CryptoCoin].self, from: data) else {
                    onFailure?("Ops! An error has occurred. Try again later!")
                    return
            }
            
            onSuccess(coins)
        }
        dataTask?.resume()
    }
}
