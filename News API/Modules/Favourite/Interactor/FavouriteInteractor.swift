//
//  FavouriteInteractor.swift
//  News API
//
//  Created by Eldor Makkambayev on 11.07.2021.
//

import Foundation

class FavouriteInteractor: FavouriteInteractorInput {
    weak var output: FavouriteInteractorOutput?
    var userStorage: UserStorageProtocol?
    
    func getFavouriteArticles() {
        var articles = userStorage?.fetchFavouriteArticleList() ?? []
        for index in 0 ..< articles.count {
            articles[index].isFavourite = true
        }
        output?.didLoadItems(articles: articles)
    }
    
    func removeFromFavourite(_ article: Article) {
        userStorage?.removeFavouriteArticle(article)
    }
}
