//
//  FavouriteInteractorOutput.swift
//  News API
//
//  Created by Eldor Makkambayev on 11.07.2021.
//

import Foundation

protocol FavouriteInteractorOutput: AnyObject, StatusPresenter {
    func didLoadItems(articles: [Article])
}
