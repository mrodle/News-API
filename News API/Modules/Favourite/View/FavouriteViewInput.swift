//
//  FavouriteViewInput.swift
//  News API
//
//  Created by Eldor Makkambayev on 11.07.2021.
//

import Foundation
protocol FavouriteViewInput: AnyObject,
                             LoadingViewProtocol,
                             StatusPresenter {
    func setItems(articles: [Article])
}
