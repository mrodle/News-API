//
//  MainPageRouter.swift
//  News API
//
//  Created by Eldor Makkambayev on 07.07.2021.
//

class MainPageRouter: MainPageRouterInput {
    weak var view: MainPageViewController?
    
    func routeToDetail(by article: Article?) {
        let detailVC = DetailPageAssembly().assemble { moduleInput in
            moduleInput.configure(data: article)
        }
        self.view?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
