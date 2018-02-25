//
//  MainPresenterTests.swift
//  CryckerTests
//
//  Created by Nicholas Meschke on 2/25/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import XCTest
@testable import Crycker

class MainPresenterTests: XCTestCase {
    
    var presenter: MainPresenter?
    var interactor: MockMainInteractor?
    var view: MockMainView?
    var router: MockMainRouter?
    
    override func setUp() {
        super.setUp()
        presenter = MainPresenter()
        interactor = MockMainInteractor()
        view = MockMainView()
        router = MockMainRouter()
        interactor?.output = presenter
        presenter?.view = view
        presenter?.interactor = interactor
        presenter?.router = router
    }

    func testOnViewWillAppearWithFetchSuccess() {
        interactor?.shouldCallSuccess = true
        presenter?.onViewWillAppear()
        
        XCTAssertEqual(interactor?.fetchedCrytoCoins, true)
        XCTAssertEqual(view?.fetchedCoins, true)
        XCTAssertEqual(view?.didShowErrorDialog, false)
    }
    
    func testOnViewWillAppearWithFetchFailure() {
        interactor?.shouldCallSuccess = false
        presenter?.onViewWillAppear()
        
        XCTAssertEqual(interactor?.fetchedCrytoCoins, true)
        XCTAssertEqual(view?.fetchedCoins, false)
        XCTAssertEqual(view?.didShowErrorDialog, true)
    }

    func testOnCoinSelected() {
        presenter?.onCoinSelected(with: CryptoCoin())
        
        XCTAssertEqual(router?.calledOpenCoinDetail, true)
    }
}
