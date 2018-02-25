//
//  MainViewControler.swift
//  Crycker
//
//  Created by Nicholas Meschke on 2/23/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, StoryboardLoadable {
    
    // MARK: Properties
    
    var presenter: MainPresentation?
    
    var coins = [CryptoCoin]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.onViewWillAppear()
    }
}

private extension MainViewController {
    func setup() {
        title = "Crycker"
        setupTableView()
    }
    
    func setupTableView() {
        tableView.register(MainTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
}

extension MainViewController: MainView {
    func showLoading() {
        // TODO
    }
    
    func dismissLoading() {
        // TODO
    }
    
    func showCoins(with coins: [CryptoCoin]) {
        self.coins = coins
    }
    
    func showMessageDialog(with text: String, title: String) {
        // TODO
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? MainTableViewCell else { return }
        
        cell.bind(with: coins[indexPath.row])
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusable(forIndexPath: indexPath) as MainTableViewCell
    }
}

