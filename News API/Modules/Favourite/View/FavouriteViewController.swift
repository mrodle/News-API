//
//  FavouriteViewController.swift
//  News API
//
//  Created by Eldor Makkambayev on 11.07.2021.
//

import Foundation
import UIKit

class FavouriteViewController: BaseViewController {
    
    var output: FavouriteViewOutput?
    var viewManager: FavouriteViewManaging?

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
        title = "Избранные"
        guard let tableView = viewManager?.tableView else { return }
        view.addSubview(tableView)
        tableView.addSubview(refreshControl)
        tableView.snp.makeConstraints({
            $0.left.bottom.right.equalToSuperview()
            $0.top.equalTo(LayoutGuidance.offset + DeviceConstants.controllerTopHeight)
        })
    }
    
    @objc
    private func didRefresh() {
        output?.refreshData()
    }
}

// MARK: - FavouriteViewInput methods
extension FavouriteViewController: FavouriteViewInput {
    func setItems(articles: [Article]) {
        refreshControl.endRefreshing()
        viewManager?.items = articles
    }
}
