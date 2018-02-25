//
//  MainInteractor.swift
//  Crycker
//
//  Created by Nicholas Meschke on 2/24/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation

class MainInteractor {
    // MARK: Properties
    
    weak var output: MainInteractorOutput?
    fileprivate var repository: CoinMarketCapRepository
    
    // MARK: Init methods
    
    init(with repository: CoinMarketCapRepository) {
        self.repository = repository
    }
}

extension MainInteractor: MainUseCase {
    func fetchCryptoCoins() {
        DispatchQueue.global(qos: .userInteractive).async {
            self.repository
                .fetchCryptoCoins(onSuccess: { coins in
                    DispatchQueue.main.async {
                        self.output?.onFetchCryptoCoinsSuccess(with: coins)
                    }
                }) { error in
                    DispatchQueue.main.async {
                        self.output?.onFetchCryptoCoinsFailure(with: error)
                    }
            }
        }
    }
}
