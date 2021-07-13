//
//  UserStorage.swift
//  News API
//
//  Created by Eldor Makkambayev on 11.07.2021.
//

import Foundation
protocol UserStorageProtocol {
    func setFavouriteArticle(_ article: Article) throws
    func removeFavouriteArticle(_ article: Article)
    func fetchFavouriteArticleList() -> [Article]
    func determineFavouriteArticle(by article: Article) -> Bool
}

final class UserStorage: UserStorageProtocol {
    private var userDefaults = UserDefaults.standard
    func setFavouriteArticle(_ article: Article) throws {
        var articleList = fetchFavouriteArticleList()
        guard articleList.firstIndex(of: article) == nil else { return }
        var data = article
        data.isFavourite = true
        articleList.append(data)
        let jsonEncoder = JSONEncoder()
        do {
            let articlesData = try jsonEncoder.encode(articleList)
            userDefaults.set(articlesData, forKey: Key.articles)
        } catch {
            throw error
        }
    }
    
    func removeFavouriteArticle(_ article: Article) {
        var list = fetchFavouriteArticleList()
        list.removeAll(where: { article == $0 })
        do { try? updateFavouriteList(aritcles: list) }
    }
    
    private func updateFavouriteList(aritcles: [Article]) throws {
        let jsonEncoder = JSONEncoder()
        do {
            let articlesData = try jsonEncoder.encode(aritcles)
            userDefaults.set(articlesData, forKey: Key.articles)
        } catch {
            throw error
        }
    }
    
    func fetchFavouriteArticleList() -> [Article] {
        let jsonDecoder = JSONDecoder()
        if let articlesData = userDefaults.value(forKey: Key.articles) as? Data {
            do {
                let articleList = try jsonDecoder.decode([Article].self, from: articlesData)
                return articleList
            } catch {
                print(error.localizedDescription)
            }
        }

        return []
    }
    
    func determineFavouriteArticle(by article: Article) -> Bool {
        var isFavourite = false
        let articleList = fetchFavouriteArticleList()
        articleList.forEach { item in
            if !isFavourite {
                isFavourite = item == article
            }
        }
        return isFavourite
    }
}
