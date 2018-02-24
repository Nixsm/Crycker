//
//  CryptoCoin.swift
//  Crycker
//
//  Created by Nicholas Meschke on 2/23/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation

class CryptoCoin: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case symbol
        case rank
        case priceUSD = "price_usd"
        case priceBTC = "price_btc"
        case last24hVolumeUSD = "24h_volume_usd"
        case marketCapUSD = "market_cap_usd"
        case availableSupply = "available_supply"
        case totalSupply = "total_supply"
        case percentChange1h = "percent_change_1h"
        case percentChange24h = "percent_change_24h"
        case percentChange7d = "percent_change_7d"
        case lastUpdated = "last_updated"
    }
    
    var id: String?
    var name: String?
    var symbol: String?
    var rank: String?
    var priceUSD: String?
    var priceBTC: String?
    var last24hVolumeUSD: String?
    var marketCapUSD: String?
    var availableSupply: String?
    var totalSupply: String?
    var percentChange1h: String?
    var percentChange24h: String?
    var percentChange7d: String?
    var lastUpdated: Date?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        symbol = try container.decode(String.self, forKey: .symbol)
        rank = try container.decode(String.self, forKey: .rank)
        priceUSD = try container.decode(String.self, forKey: .priceUSD)
        priceBTC = try container.decode(String.self, forKey: .priceBTC)
        last24hVolumeUSD = try container.decode(String.self, forKey: .last24hVolumeUSD)
        marketCapUSD = try container.decode(String.self, forKey: .marketCapUSD)
        availableSupply = try container.decode(String.self, forKey: .availableSupply)
        totalSupply = try container.decode(String.self, forKey: .totalSupply)
        percentChange1h = try container.decode(String.self, forKey: .percentChange1h)
        percentChange24h = try container.decode(String.self, forKey: .percentChange24h)
        percentChange7d = try container.decode(String.self, forKey: .percentChange7d)

        let dateString = try container.decode(String.self, forKey: .lastUpdated)
        
        guard let dateTimeInterval = TimeInterval(dateString) else {
            throw DecodingError.dataCorruptedError(forKey: .lastUpdated, in: container, debugDescription: "Date string does not match format expected by formatter.")
        }
        
        lastUpdated =  Date(timeIntervalSince1970: dateTimeInterval)
    }

    
}
