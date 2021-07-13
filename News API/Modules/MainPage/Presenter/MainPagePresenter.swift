//
//  MainPagePresenter.swift
//  News API
//
//  Created by Eldor Makkambayev on 07.07.2021.
//

import Foundation

enum ArticlesType: String, Codable {
    case topheadlines = "top-headlines"
    case everthing = "everything"
}

class MainPagePresenter {
    weak var view: MainPageViewInput?
    var router: MainPageRouterInput?
    var interactor: MainPageInteractorInput?
    var userStorage: UserStorageProtocol?
    private var articles: [Article] = []
    private var timer: Timer?
    private var resultsCount: Int = -1
    private var page: Int = 1
    private var selectedType: ArticlesType = .topheadlines {
        didSet {
            updateTopHeadlines()
        }
    }
    
    private func updateTopHeadlines() {
        if selectedType == .topheadlines {
            timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        } else {
            timer?.invalidate()
            timer = nil
        }
    }

    private func setFavouriteArticles() {
        for i in 0..<articles.count {
            articles[i].isFavourite = userStorage?.determineFavouriteArticle(by: articles[i]) ?? true
        }
        view?.setItems(articles: articles, type: selectedType, page: page)
    }
    
    @objc private func timerAction() {
        if selectedType == .topheadlines {
            getArticles(by: selectedType, page: 1, showLoader: false)
        } else {
            timer?.invalidate()
            timer = nil
        }
    }
}

// MARK: - MainPageViewOutput methods
extension MainPagePresenter: MainPageViewOutput {    
    func didLoad() {
        getArticles(by: .topheadlines)
    }
    
    func willAppear() {
        setFavouriteArticles()
    }
    
    func refreshData() {
        getArticles(by: selectedType)
    }
    
    func getArticles(by type: ArticlesType,
                     page: Int = 1,
                     showLoader: Bool = true) {
        self.page = page
        selectedType = type
        if showLoader { view?.showLoading() }
        interactor?.getArticles(by: "в", type, page: page)
    }
}

// MARK: - MainPageInteractorOutput methods
extension MainPagePresenter: MainPageInteractorOutput {
    func didLoadItems(articles: [Article], resultsCount: Int) {
        view?.hideLoading()
        if page == 1 { self.articles = []}
        self.articles.append(contentsOf: articles)
        self.resultsCount = resultsCount
        view?.setItems(articles: articles, type: selectedType, page: page)
        setFavouriteArticles()
        updateTopHeadlines()
    }
    
    func showError(message: String) {
        view?.showError(message: message)
    }
}

// MARK: - MainPageViewManagerOutput methods
extension MainPagePresenter: MainPageViewManagerOutput {
    func getPaginationItems(by indexPath: IndexPath) {
        guard resultsCount > indexPath.row else { return }
        page += 1
        getArticles(by: selectedType, page: page)
    }
    
    func setFavouriteArticle(_ article: Article?) {
        guard let article = article else { return }
        do { try? self.userStorage?.setFavouriteArticle(article) }
    }
    
    func removeFavouriteArticle(_ article: Article?) {
        guard let article = article else { return }
        self.userStorage?.removeFavouriteArticle(article)
    }
    
    func getArticleDetail(_ article: Article?) {
        router?.routeToDetail(by: article)
    }
}
