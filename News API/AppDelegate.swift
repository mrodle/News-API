//
//  AppDelegate.swift
//  News API
//
//  Created by Eldor Makkambayev on 07.07.2021.
//

import UIKit
import SnapKit
import Kingfisher

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var appManager: AppManaging?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        if let appWindow = window {
            appManager = AppManager(window: appWindow)
            appManager?.setup()
        }
        // Override point for customization after application launch.
        return true
    }
}

