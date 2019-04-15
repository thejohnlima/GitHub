//
//  AppDelegate.swift
//  Github
//
//  Created by John Lima on 14/04/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {

  // MARK: - Properties
  var window: UIWindow?

  // MARK: - Private Methods
  private func initialize() {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = HomeViewController()
    window?.makeKeyAndVisible()
  }
}

// MARK: - UIApplicationDelegate
extension AppDelegate: UIApplicationDelegate {
  // swiftlint:disable discouraged_optional_collection
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    initialize()
    return true
  }
}
