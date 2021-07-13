//
//  MainPageViewOutput.swift
//  News API
//
//  Created by Eldor Makkambayev on 07.07.2021.
//

protocol MainPageViewOutput: AnyObject {
    func didLoad()
    func willAppear()
    func refreshData()
    func getArticles(by type: ArticlesType,
                     page: Int,
                     showLoader: Bool)
}
