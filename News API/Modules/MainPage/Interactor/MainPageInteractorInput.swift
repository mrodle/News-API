//
//  MainPageInteractorInput.swift
//  News API
//
//  Created by Eldor Makkambayev on 07.07.2021.
//

protocol MainPageInteractorInput {
    func getArticles(by keyword: String,
                      _ type: ArticlesType,
                      page: Int)
}
