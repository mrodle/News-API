//
//  LoadingView.swift
//  News API
//
//  Created by Eldor Makkambayev on 07.07.2021.
//

import Foundation
import UIKit

final class LoadingView: UIView {
    
    var isLoading: Bool = false
    
    private var loaderContainerView = UIView()
    private var loaderView: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView()
        loader.hidesWhenStopped = true
        loader.layer.masksToBounds = true
        loader.backgroundColor = .white
        loader.color = .lightGray

        return loader
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        alpha = 0.0
        configureActivityIndicatorView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startLoading() {
        if isLoading { return }
        
        isLoading = true
        loaderView.startAnimating()
        UIView.animate(withDuration: Constants.showLoadingViewAnimationDuration, animations: {
            self.alpha = 1.0
        })
    }
    
    func stopLoading() {
        self.isLoading = false
        UIView.animate(withDuration: Constants.showLoadingViewAnimationDuration, animations: {
            self.alpha = 0.0
        }) { (_) in
            self.loaderView.startAnimating()
        }
    }
    
    private func configureActivityIndicatorView() {
        addSubview(loaderContainerView)
        loaderContainerView.addSubview(loaderView)

        loaderContainerView.layer.cornerRadius = 10
        loaderContainerView.backgroundColor = .white
        
        loaderContainerView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(72)
        }
        loaderView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(30)
        }
    }
}
