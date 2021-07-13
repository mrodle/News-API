//
//  FavouriteRouter.swift
//  News API
//
//  Created by Eldor Makkambayev on 11.07.2021.
//

import Foundation

class FavouriteRouter: FavouriteRouterInput {
    weak var view: FavouriteViewController?
    
    func routeToDetail(by article: Article?) {
        let detailVC = DetailPageAssembly().assemble { moduleInput in
            moduleInput.configure(data: article)
        }
        self.view?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
