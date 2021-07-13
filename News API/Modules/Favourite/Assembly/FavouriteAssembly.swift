//
//  FavouriteAssembly.swift
//  News API
//
//  Created by Eldor Makkambayev on 11.07.2021.
//

import Foundation

class FavouriteAssembly {
    func assemble() -> FavouriteViewController {
        let viewController = FavouriteViewController()
        let router = FavouriteRouter()
        router.view = viewController
        
        let presenter = FavouritePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = FavouriteInteractor()
        interactor.userStorage = UserStorage()
        interactor.output = presenter
        presenter.interactor = interactor
        
        let viewManager = FavouriteViewManager()
        viewManager.output = presenter
        viewController.viewManager = viewManager
        viewController.output = presenter
        return viewController

    }
}
