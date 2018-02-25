//
//  MainContract.swift
//  Crycker
//
//  Created by Nicholas Meschke on 2/24/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation

protocol MainView: class {
    func showLoading()
    func dismissLoading()
    func showCoins(with coins: [CryptoCoin])
    func showMessageDialog(with text: String, title: String)
}

protocol MainPresentation: class {
    func onViewWillAppear()
}

protocol MainUseCase: class {
    func fetchCryptoCoins()
}

protocol MainInteractorOutput: class {
    func onFetchCryptoCoinsSuccess(with cryptos: [CryptoCoin])
    func onFetchCryptoCoinsFailure(with error: String)
}

protocol MainWireFrame: class {
    // TODO
}

