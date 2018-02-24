//
//  Endpoints.swift
//  Crycker
//
//  Created by Nicholas Meschke on 2/23/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation

class Endpoints {
    fileprivate static let baseUrl = "https://api.coinmarketcap.com/v1"
    
    static func ticker(_ limit: Int) -> URL? {
        let endpoint = "\(baseUrl)/ticker/"
        var urlComponents = URLComponents(string: endpoint)
        
        let parameters: [String: Any] = [
            "limit": limit
        ]
        urlComponents?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        return urlComponents?.url
    }
}
