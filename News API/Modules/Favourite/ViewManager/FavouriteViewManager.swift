//
//  FavouriteViewManager.swift
//  News API
//
//  Created by Eldor Makkambayev on 11.07.2021.
//

import Foundation
import UIKit

protocol FavouriteViewManaging {
    var tableView: UITableView? { get set }
    var items: [Article] { get set }
}

protocol FavouriteViewManagerOutput {
    func removeFromFavourite(article: Article?)
    func getArticleDetail(_ article: Article?)
}

class FavouriteViewManager: NSObject, FavouriteViewManaging {
    var output: FavouriteViewManagerOutput?
    
    lazy var tableView: UITableView? = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.estimatedRowHeight = 120
        tableView.estimatedSectionFooterHeight = 0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.keyboardDismissMode = .onDrag
        tableView.backgroundColor = .clear
        tableView.register(MainTableViewCell.self,
                           forCellReuseIdentifier: "mainCellIdentifier")
        return tableView
    }()
    
    var items: [Article] = [] {
        didSet {
            tableView?.reloadData()
        }
    }
}

extension FavouriteViewManager: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCellIdentifier") as? MainTableViewCell
        cell?.setup(data: items[indexPath.row])
        cell?.saveClosure = { [weak self] _ in
            self?.output?.removeFromFavourite(article: self?.items[indexPath.row])
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard items.count - 1 == indexPath.row else { return}
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output?.getArticleDetail(items[indexPath.row])
    }
}

