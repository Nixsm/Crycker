//
//  CoinDetailViewController.swift
//  Crycker
//
//  Created by Nicholas Meschke on 2/25/18.
//Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation
import UIKit

class CoinDetailViewController: UIViewController, StoryboardLoadable {

    // MARK: Properties

    var presenter: CoinDetailPresentation?

    // MARK: IBOutlets
    
    @IBOutlet weak var priceUSDLabel: UILabel!
    @IBOutlet weak var priceBTCLabel: UILabel!
    @IBOutlet weak var last24hVolumeLabel: UILabel!
    @IBOutlet weak var marketCapLabel: UILabel!
    @IBOutlet weak var availableLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var last1hLabel: UILabel!
    @IBOutlet weak var last24hLabel: UILabel!
    @IBOutlet weak var last7dLabel: UILabel!
    @IBOutlet weak var lastUpdatedLabel: UILabel!
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
    }
}

extension CoinDetailViewController: CoinDetailView {
    func setupView(with coin: CryptoCoin) {
        title = coin.name
        priceUSDLabel.text = coin.priceUSD?.asUsdCurrency
        priceBTCLabel.text = "$BTC \(coin.priceBTC ?? "")"
        last24hVolumeLabel.text = coin.last24hVolumeUSD
        marketCapLabel.text = coin.marketCapUSD?.asUsdCurrency
        availableLabel.text = coin.availableSupply
        totalLabel.text = coin.totalSupply
        last1hLabel.text = "\(coin.percentChange1h ?? "")%"
        last24hLabel.text = "\(coin.percentChange24h ?? "")%"
        last7dLabel.text = "\(coin.percentChange7d ?? "")%"
        guard let lastUpdated = coin.lastUpdated else {
            lastUpdatedLabel.text = "Never"
            return
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale.current
        lastUpdatedLabel.text = dateFormatter.string(from: lastUpdated)
    }
}
