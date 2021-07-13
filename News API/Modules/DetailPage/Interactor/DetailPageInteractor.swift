//
//  DetailPageInteractor.swift
//  News API
//
//  Created by Eldor Makkambayev on 11.07.2021.
//

import Foundation

class DetailPageInteractor: DetailPageInteractorInput {
    weak var output: DetailPageInteractorOutput?
    var userStorage: UserStorageProtocol?
    
    func setArticleFavourite(article: Article) {
        do { try? userStorage?.setFavouriteArticle(article) }
    }
    
    func removeFavouriteArticle(article: Article) {
        userStorage?.removeFavouriteArticle(article)
    }
}
