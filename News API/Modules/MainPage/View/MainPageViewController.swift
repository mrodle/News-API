//
//  MainPageViewController.swift
//  News API
//
//  Created by Eldor Makkambayev on 07.07.2021.
//

import Foundation
import UIKit

class MainPageViewController: BaseViewController {
    
    var output: MainPageViewOutput?
    var viewManager: MainPageViewManaging?

    private var segmentView = UISegmentedControl(items: ["Top headliens",
                                                         "Everything"])
    private let refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(didRefresh), for: .valueChanged)
        return refresh
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.didLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output?.willAppear()
    }
    
    private func setupUI() {
        title = "Главная"
        guard let tableView = viewManager?.tableView else { return }
        segmentView.addTarget(self, action: #selector(segmentedControlValueChanged(_:)),
                              for: .valueChanged)
        [segmentView, tableView].forEach({
            view.addSubview($0)
        })
        segmentView.selectedSegmentIndex = 0
        tableView.addSubview(refreshControl)

        segmentView.snp.makeConstraints({
            $0.left.right.equalToSuperview().inset(LayoutGuidance.offset)
            $0.top.equalTo(LayoutGuidance.offset + DeviceConstants.controllerTopHeight)
        })
        
        tableView.snp.makeConstraints({
            $0.left.bottom.right.equalToSuperview()
            $0.top.equalTo(segmentView.snp.bottom).offset(12)
        })
    }
    
    @objc
    private func didRefresh() {
        output?.refreshData()
    }
    
    @objc
    private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        let selectedArticleType: ArticlesType = sender.selectedSegmentIndex == 0 ?
            .topheadlines : .everthing
        viewManager?.items = []
        output?.getArticles(by: selectedArticleType, page: 1, showLoader: true)
    }
}

// MARK: - MainPageViewInput methods
extension MainPageViewController: MainPageViewInput {
    func setItems(articles: [Article],
                  type: ArticlesType,
                  page: Int) {
        if page == 1 { viewManager?.items = [] }
        refreshControl.endRefreshing()
        viewManager?.items.append(contentsOf: articles)
    }
}
