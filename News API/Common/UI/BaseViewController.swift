//
//  BaseViewController.swift
//  News API
//
//  Created by Eldor Makkambayev on 07.07.2021.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    var loadingView: LoadingView = {
        let view = LoadingView()
        view.layer.zPosition = 1
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        view.alpha = 0.0
        view.frame = view.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 11.0, *) {} else {
            edgesForExtendedLayout = []
        }
        
        createLoadingView()
    }

    func createLoadingView() {
        view.addSubview(loadingView)
        
        loadingView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func showLoading() {
        DispatchQueue.main.async { [weak self] in
            self?.loadingView.startLoading()
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async { [weak self] in
            self?.loadingView.stopLoading()
        }
    }
    
    func showError(message: String) {
        hideLoading()
        let controller = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
    }
}
