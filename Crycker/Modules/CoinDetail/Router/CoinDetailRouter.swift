//
//  CoinDetailRouter.swift
//  Crycker
//
//  Created by Nicholas Meschke on 2/25/18.
//Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation
import UIKit

class CoinDetailRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule(with coin: CryptoCoin) -> CoinDetailViewController {
        let viewController = UIStoryboard.loadViewController() as CoinDetailViewController
        let presenter = CoinDetailPresenter()
        let router = CoinDetailRouter()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.coin = coin

        router.view = viewController

        return viewController
    }
}

extension CoinDetailRouter: CoinDetailWireframe {
    // TODO: Implement wireframe methods
}
