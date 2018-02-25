//
//  MainViewTests.swift
//  CryckerTests
//
//  Created by Nicholas Meschke on 2/25/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import XCTest
@testable import Crycker

class MainViewTests: XCTestCase {
    
    var mainView: MainViewController?
    var presenter: MockMainPresenter?
    
    override func setUp() {
        super.setUp()
        mainView = UIStoryboard.loadViewController() as MainViewController
        presenter = MockMainPresenter()
        mainView?.presenter = presenter
        
        UIApplication.shared.keyWindow?.rootViewController = mainView
        _ = mainView?.view
    }
    
    func testOnViewWillAppear() {
        XCTAssertEqual(presenter?.viewWillAppearCalled, true)
    }
    
    func testOnCoinSelected() {
        guard let tableView = mainView?.tableView else {
            XCTAssertNil(mainView?.tableView)
            return
        }
        mainView?.coins = [CryptoCoin()]
        mainView?.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(presenter?.onCoinSelectedCalled, true)
    }
}
