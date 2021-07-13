//
//  DetailPageViewController.swift
//  News API
//
//  Created by Eldor Makkambayev on 11.07.2021.
//

import Foundation
import UIKit

class DetailPageViewController: BaseViewController {
    
    var output: DetailPageViewOutput?
    private var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    private var containerView = UIView()
    private var contentImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        return view
    }()
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    private var authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .left
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .lightGray
        return label
    }()
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .lightGray
        return label
    }()
    private var contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .lightGray
        return label
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        output?.didLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setupUI() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "mini_unsaved")?
                                                                    .withRenderingMode(.alwaysOriginal),
                                                                 style: .done,
                                                                 target: self,
                                                                 action: #selector(saveAction))
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        [contentImageView,
         titleLabel,
         authorLabel,
         dateLabel,
         descriptionLabel,
         contentLabel].forEach({
            containerView.addSubview($0)
         })
        
        scrollView.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })
        containerView.snp.makeConstraints({
            $0.edges.equalToSuperview()
            $0.width.equalTo(view.snp.width)
        })
        contentImageView.snp.makeConstraints({
            $0.top.equalTo(DeviceConstants.controllerTopHeight)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(view.bounds.width/2)
        })
        titleLabel.snp.makeConstraints({
            $0.top.equalTo(contentImageView.snp.bottom).offset(LayoutGuidance.offsetHalf)
            $0.left.right.equalToSuperview().inset(LayoutGuidance.offset)
        })
        authorLabel.snp.makeConstraints({
            $0.left.right.equalTo(titleLabel)
            $0.top.equalTo(titleLabel.snp.bottom)
                .offset(LayoutGuidance.offsetHalf)
        })
        authorLabel.snp.makeConstraints({
            $0.left.right.equalTo(titleLabel)
            $0.top.equalTo(titleLabel.snp.bottom)
                .offset(LayoutGuidance.offsetHalf)
        })
        dateLabel.snp.makeConstraints({
            $0.left.right.equalTo(titleLabel)
            $0.top.equalTo(authorLabel.snp.bottom)
                .offset(LayoutGuidance.offsetHalf)
        })
        descriptionLabel.snp.makeConstraints({
            $0.left.right.equalTo(titleLabel)
            $0.top.equalTo(dateLabel.snp.bottom)
                .offset(LayoutGuidance.offsetHalf)
        })
        contentLabel.snp.makeConstraints({
            $0.left.right.equalTo(titleLabel)
            $0.top.equalTo(descriptionLabel.snp.bottom)
                .offset(LayoutGuidance.offsetHalf)
            $0.bottom.lessThanOrEqualTo(-LayoutGuidance.offset)
        })
    }
    
    @objc func saveAction() {
        output?.didSaveButtonTapped()
        navigationItem.rightBarButtonItem?.image =
            navigationItem.rightBarButtonItem?.image == UIImage(named: "mini_unsaved")?.withRenderingMode(.alwaysOriginal) ?
            UIImage(named: "mini_saved")?.withRenderingMode(.alwaysOriginal) :
            UIImage(named: "mini_unsaved")?.withRenderingMode(.alwaysOriginal)
    }
}

// MARK: - DetailPageViewInput methods
extension DetailPageViewController: DetailPageViewInput {
    func setup(data: Article?) {
        if let article = data {
            title = article.title
            titleLabel.text = article.title
            authorLabel.text = article.author
            dateLabel.text = article.publishedAt
            descriptionLabel.text = article.articleDescription
            contentLabel.text = article.content
            if let imageUrl = article.urlToImage,
               let url = URL(string: imageUrl) {
                contentImageView.kf.setImage(with: url)
            }
            navigationItem.rightBarButtonItem?.image = article.isFavourite ?
                UIImage(named: "mini_saved")?.withRenderingMode(.alwaysOriginal) :
                UIImage(named: "mini_unsaved")?.withRenderingMode(.alwaysOriginal)
        }
    }
}
