//
//  CoinDetailContract.swift
//  Crycker
//
//  Created by Nicholas Meschke on 2/25/18.
//Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation

protocol CoinDetailView: class {
    func setupView(with coin: CryptoCoin)
}

protocol CoinDetailPresentation: class {
    func onViewDidLoad()
}

protocol CoinDetailWireframe: class {
    // TODO: Declare wireframe methods
}
