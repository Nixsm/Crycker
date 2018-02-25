//
//  MainTableViewCell.swift
//  Crycker
//
//  Created by Nicholas Meschke on 2/24/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell, NibLoadable, ReusableView {

    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var marketCapLabel: UILabel!
    
    func bind(with coin: CryptoCoin) {
        symbolLabel.text = coin.symbol
        nameLabel.text = coin.name
        // TODO maybe format this
        
        guard let marketCapUSD = Double(coin.marketCapUSD ?? "") else { return }
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencyCode = "USD"
        let convertedPrice = currencyFormatter.string(from: NSNumber(floatLiteral: marketCapUSD))

        marketCapLabel.text = convertedPrice
    }
}
