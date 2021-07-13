//
//  AppManager.swift
//  News API
//
//  Created by Eldor Makkambayev on 07.07.2021.
//

import Foundation
import UIKit

protocol AppManaging {
    func setup()
}

final class AppManager: AppManaging {
    private var window: UIWindow
    required init(window: UIWindow) {
        self.window = window
    }

    func setup() {
        window.makeKeyAndVisible()
        window.backgroundColor = .white
        let viewController = UINavigationController(
            rootViewController: TabBarController())
        window.rootViewController = viewController
    }

}
