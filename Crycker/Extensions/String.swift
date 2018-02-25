//
//  String.swift
//  Crycker
//
//  Created by Nicholas Meschke on 2/25/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation

extension String {

    var asUsdCurrency: String? {
        get {
            guard let selfAsDouble = Double(self) else { return nil }
            let currencyFormatter = NumberFormatter()
            currencyFormatter.numberStyle = .currency
            currencyFormatter.currencyCode = "USD"
            return currencyFormatter.string(from: NSNumber(floatLiteral: selfAsDouble))
        }
    }
}
