//
//  DetailPagePresenter.swift
//  News API
//
//  Created by Eldor Makkambayev on 11.07.2021.
//

import Foundation

class DetailPagePresenter {
    weak var view: DetailPageViewInput?
    var router: DetailPageRouterInput?
    var interactor: DetailPageInteractorInput?
    private var article: Article?
}

// MARK: - DetailPageViewOutput methods
extension DetailPagePresenter: DetailPageViewOutput {
    func didLoad() {
        view?.setup(data: article)
    }
    
    func didSaveButtonTapped() {
        guard let article = article else { return }
        if article.isFavourite {
            interactor?.removeFavouriteArticle(article: article)
        } else {
            interactor?.setArticleFavourite(article: article)
        }
    }
}

// MARK: - DetailPageInteractorOutput methods
extension DetailPagePresenter: DetailPageInteractorOutput {
    func showError(message: String) {
        view?.showError(message: message)
    }
}

// MARK: - DetailPageModuleInput methods
extension DetailPagePresenter: DetailPageModuleInput {
    func configure(data: Article?) {
        self.article = data
    }
}
