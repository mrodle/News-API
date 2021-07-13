//
//  FavouritePresenter.swift
//  News API
//
//  Created by Eldor Makkambayev on 11.07.2021.
//

import Foundation

class FavouritePresenter {
    weak var view: FavouriteViewInput?
    var router: FavouriteRouterInput?
    var interactor: FavouriteInteractorInput?
}

// MARK: - FavouriteViewOutput methods
extension FavouritePresenter: FavouriteViewOutput {
    func didLoad() {

    }
    
    func willAppear() {
        interactor?.getFavouriteArticles()
    }
    
    func refreshData() {
        interactor?.getFavouriteArticles()
    }
}

// MARK: - FavouriteInteractorOutput methods
extension FavouritePresenter: FavouriteInteractorOutput {
    func didLoadItems(articles: [Article]) {
        view?.hideLoading()
        view?.setItems(articles: articles)
    }
    
    func showError(message: String) {
        view?.showError(message: message)
    }
}

// MARK: - FavouriteViewManagerOutput methods
extension FavouritePresenter: FavouriteViewManagerOutput {
    func removeFromFavourite(article: Article?) {
        guard let article = article else { return }
        interactor?.removeFromFavourite(article)
        refreshData()
    }
    
    func getArticleDetail(_ article: Article?) {
        router?.routeToDetail(by: article)
    }
}
