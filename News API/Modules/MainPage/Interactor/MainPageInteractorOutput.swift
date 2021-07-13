//
//  MainPageInteractorOutput.swift
//  News API
//
//  Created by Eldor Makkambayev on 07.07.2021.
//

protocol MainPageInteractorOutput: AnyObject, StatusPresenter {
    func didLoadItems(articles: [Article], resultsCount: Int)
}
