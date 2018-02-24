//
//  CoinMarketCapURLSessionDelegateImplementation.swift
//  Crycker
//
//  Created by Nicholas Meschke on 2/24/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation

class CoinMarketCapURLSessionDelegateImplementation: NSObject {
    
    var onSuccess: (([CryptoCoin]) -> Void)?
    var onFailure: ((String) -> Void)?
}

extension CoinMarketCapURLSessionDelegateImplementation: URLSessionDataDelegate {
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let error = error {
            onFailure?(error.localizedDescription)
        }
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        let coins = try? JSONDecoder().decode([CryptoCoin].self, from: data)
    }
}
