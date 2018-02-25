//
//  MainPresenter.swift
//  Crycker
//
//  Created by Nicholas Meschke on 2/24/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation

class MainPresenter {
    // MARK: Properties
    
    weak var view: MainView?
    var interactor: MainUseCase?
    var router: MainWireFrame?
}

extension MainPresenter: MainPresentation {
    func onViewWillAppear() {
        interactor?.fetchCryptoCoins()
    }
}

extension MainPresenter: MainInteractorOutput {
    func onFetchCryptoCoinsSuccess(with cryptos: [CryptoCoin]) {
        view?.showCoins(with: cryptos)
    }
    
    func onFetchCryptoCoinsFailure(with error: String) {
        view?.showMessageDialog(with: error, title: "Error")
    }
}
