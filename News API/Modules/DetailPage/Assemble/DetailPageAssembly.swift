//
//  DetailPageAssembly.swift
//  News API
//
//  Created by Eldor Makkambayev on 11.07.2021.
//

import Foundation

protocol DetailPageModuleInput {
    func configure(data: Article?)
}

typealias DetailPageConfiguration = ((DetailPageModuleInput) -> ())

class DetailPageAssembly {
    func assemble(_ configuration: DetailPageConfiguration?) -> DetailPageViewController {
        let viewController = DetailPageViewController()
        let router = DetailPageRouter()
        router.view = viewController
        
        let presenter = DetailPagePresenter()
        presenter.view = viewController
        presenter.router = router
        _ = configuration?(presenter)

        let interactor = DetailPageInteractor()
        interactor.output = presenter
        interactor.userStorage = UserStorage()
        presenter.interactor = interactor
        
        viewController.output = presenter
        return viewController

    }
}
