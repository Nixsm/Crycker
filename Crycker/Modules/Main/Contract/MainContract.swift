//
//  MainContract.swift
//  Crycker
//
//  Created by Nicholas Meschke on 2/24/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation

protocol MainView: class {
    func showCoins(with coins: [CryptoCoin])
    func showErrorDialog(with text: String, title: String)
}

protocol MainPresentation: class {
    func onViewWillAppear()
    func onCoinSelected(with coin: CryptoCoin)
}

protocol MainUseCase: class {
    func fetchCryptoCoins()
}

protocol MainInteractorOutput: class {
    func onFetchCryptoCoinsSuccess(with cryptos: [CryptoCoin])
    func onFetchCryptoCoinsFailure(with error: String)
}

protocol MainWireFrame: class {
    func openCoinDetail(for coin: CryptoCoin)
}

