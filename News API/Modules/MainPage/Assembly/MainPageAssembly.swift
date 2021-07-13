//
//  MainPageAssembly.swift
//  News API
//
//  Created by Eldor Makkambayev on 07.07.2021.
//

import Foundation
import UIKit

class MainPageAssembly {
    
    func assemble() -> MainPageViewController {
        let viewController = MainPageViewController()
        let router = MainPageRouter()
        router.view = viewController
        
        let presenter = MainPagePresenter()
        presenter.view = viewController
        presenter.router = router
        presenter.userStorage = UserStorage()
        
        let interactor = MainPageInteractor()
        interactor.output = presenter
        presenter.interactor = interactor
        
        let viewManager = MainPageViewManager()
        viewManager.output = presenter
        viewController.viewManager = viewManager
        viewController.output = presenter
        return viewController
    }
}
