//
//  DetailPageInteractorInput.swift
//  News API
//
//  Created by Eldor Makkambayev on 11.07.2021.
//

import Foundation

protocol DetailPageInteractorInput {
    func setArticleFavourite(article: Article)
    func removeFavouriteArticle(article: Article)
}
