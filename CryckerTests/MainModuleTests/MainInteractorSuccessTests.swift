//
//  MainInteractorTests.swift
//  CryckerTests
//
//  Created by Nicholas Meschke on 2/25/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import XCTest
@testable import Crycker

class MainInteractorSuccessTests: XCTestCase {
    
    var interactor: MainInteractor?
    var interactorOutput: MockMainInteractorOutput?

    override func setUp() {
        super.setUp()
        let repository = MockCoinMarketCapRepository(with: true)
        interactor = MainInteractor(with: repository)
        interactorOutput = MockMainInteractorOutput()

        interactor?.output = interactorOutput
    }

    func testFetchCoinsSuccess() {
        interactor?.fetchCryptoCoins()
        
        XCTAssertEqual(interactorOutput?.succeeded, true)
    }
}
