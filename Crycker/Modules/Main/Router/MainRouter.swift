//
//  MainRouter.swift
//  Crycker
//
//  Created by Nicholas Meschke on 2/24/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import Foundation
import UIKit

class MainRouter {
    // MARK: Properties
    
    weak var view: UIViewController?
    
    // MARK: Static methods
    
    static func setupModule() -> MainViewController {
        let viewController = UIStoryboard.loadViewController() as MainViewController
        let presenter = MainPresenter()
        let router = MainRouter()
        let interactor = MainInteractor(with: CoinMarketCapApiRepository())
        
        viewController.presenter =  presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        router.view = viewController
        
        interactor.output = presenter
        
        return viewController
    }
}

extension MainRouter: MainWireFrame {
    // TODO
}
