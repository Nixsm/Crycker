//
//  CoinDetailPresenter.swift
//  Crycker
//
//  Created by Nicholas Meschke on 2/25/18.
//Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation

class CoinDetailPresenter {

    // MARK: Properties

    weak var view: CoinDetailView?
    var router: CoinDetailWireframe?
    var coin: CryptoCoin?
}

extension CoinDetailPresenter: CoinDetailPresentation {
    func onViewDidLoad() {
        guard let coin = coin else { return }
        view?.setupView(with: coin)
    }
}
