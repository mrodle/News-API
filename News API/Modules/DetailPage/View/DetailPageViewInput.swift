//
//  DetailPageViewInput.swift
//  News API
//
//  Created by Eldor Makkambayev on 11.07.2021.
//

import Foundation

protocol DetailPageViewInput: AnyObject,
                            LoadingViewProtocol,
                            StatusPresenter {
    func setup(data: Article?)
}
