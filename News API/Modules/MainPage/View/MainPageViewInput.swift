//
//  MainPageViewInput.swift
//  News API
//
//  Created by Eldor Makkambayev on 07.07.2021.
//

protocol MainPageViewInput: AnyObject,
                            LoadingViewProtocol,
                            StatusPresenter {
    func setItems(articles: [Article],
                  type: ArticlesType,
                  page: Int)
}
