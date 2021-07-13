//
//  TabBarController.swift
//  News API
//
//  Created by Eldor Makkambayev on 08.07.2021.
//

import Foundation
import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let primaryViewController = UINavigationController(
            rootViewController: MainPageAssembly().assemble())
        primaryViewController.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(named: "home_icon"), tag: 0)

        let favouriteViewController = UINavigationController(
            rootViewController: FavouriteAssembly().assemble())
        favouriteViewController.tabBarItem = UITabBarItem(title: "Избранные", image: UIImage(named: "favourite_icon"), tag: 1)
        
        let viewControllerList = [primaryViewController,
                                  favouriteViewController]
        viewControllers = viewControllerList
        configureTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func configureTabBar() {
        tabBar.backgroundColor = .white
//        tabBar.tintColor = .ligh
//        tabBar.unselectedItemTintColor = .tabBarUnselected
        tabBar.itemPositioning = .centered
        tabBar.isTranslucent = false
        tabBar.items?.forEach {
            $0.badgeColor = .orange
        }
    }

}
