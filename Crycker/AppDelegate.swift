//
//  AppDelegate.swift
//  Crycker
//
//  Created by Nicholas Meschke on 2/23/18.
//  Copyright © 2018 Nicholas Meschke. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    fileprivate var firstViewController: UIViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UIApplication.shared.setMinimumBackgroundFetchInterval(UIApplicationBackgroundFetchIntervalMinimum)
        setupFirstModule()
        return true
    }
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        DispatchQueue.global(qos: .background).async {
            CoinMarketCapApiRepository().fetchCryptoCoins(onSuccess: { _ in
                completionHandler(.newData)
            }, onFailure: { _ in
                completionHandler(.failed)
            })
        }
    }
    
    fileprivate func setupFirstModule() {
        let firstViewController = MainRouter.setupModule()
        window?.rootViewController = UINavigationController(rootViewController: firstViewController)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }
}

