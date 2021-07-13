//
//  MainPageInteractor.swift
//  News API
//
//  Created by Eldor Makkambayev on 07.07.2021.
//

import Foundation

class MainPageInteractor: MainPageInteractorInput {
    weak var output: MainPageInteractorOutput?
    private let networkManager = NetworkManager()

    func getArticles(by keyword: String,
                     _ type: ArticlesType,
                     page: Int) {
        networkManager.fetchArticles(by: keyword,
                                     page: page,
                                     type: type,
                                     completion: { [weak self] result in
            switch result {
            case .success(let response):
                self?.output?.didLoadItems(articles: response.articles,
                                           resultsCount: response.totalResults)
            case .failure(let error):
                self?.output?.showError(message: error.localizedDescription)
            }
        })
    }
}
