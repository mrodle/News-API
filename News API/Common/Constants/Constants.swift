//
//  Constants.swift
//  News API
//
//  Created by Eldor Makkambayev on 09.07.2021.
//

import Foundation
import UIKit

enum AppConfigs {
    public static var baseUrl: String = "https://newsapi.org/v2/"
    public static var apiKey: String = "5a1e97c1cf91437aa05b774c1c8c2b99"
}

enum Key {
    public static let articles: String = "articles"
}

enum Constants {
    static let showLoadingViewAnimationDuration: Double = 0.25
}

enum LayoutGuidance {
    /// Standard margin = 16px
    static let offset: CGFloat = 16.0
    /// Half margin = 8px
    static let offsetHalf: CGFloat = LayoutGuidance.offset / 2
    /// Quarter margin = 4px
    static let offsetQuarter: CGFloat = LayoutGuidance.offset / 4
    /// 3/4 of standard margin = 12px
    static let offsetThreeQuarters: CGFloat = LayoutGuidance.offsetQuarter * 3
    /// Standard margin + Half margin = 24px
    static let offsetAndHalf: CGFloat = 24.0
    /// Standard margin * 2 = 32px
    static let offsetDouble: CGFloat = 32.0
    /// Standard corner radius = 12px
    static let cornerRadius: CGFloat = 12.0
    /// Standard top view height = 64px
    static let topViewHeight: CGFloat = 64.0
    /// Standart one line labeled table view cell estimate height
    static let estimatedLabeledCellHeight: Int = 52
}

enum DeviceConstants {
    static let screenHeight: CGFloat = UIScreen.main.bounds.size.height
    static let screenWidth: CGFloat = UIScreen.main.bounds.size.width
    static let screenHeightHalf: CGFloat = DeviceConstants.screenHeight / 2.0
    static let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
    static let navBarHeight = UINavigationController().navigationBar.bounds.height
    static let controllerTopHeight = statusBarHeight+navBarHeight
}
