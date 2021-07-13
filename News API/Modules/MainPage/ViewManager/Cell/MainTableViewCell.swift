//
//  MainTableViewCell.swift
//  News API
//
//  Created by Eldor Makkambayev on 09.07.2021.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    var saveClosure: ((Bool) -> ())?
    private var contentImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 6
        view.layer.masksToBounds = true
        return view
    }()
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    private var saveButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "unsaved"), for: .normal)
        button.setImage(UIImage(named: "saved"), for: .selected)
        return button
    }()
    private var authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        label.textColor = .darkGray
        return label
    }()
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        label.textColor = .lightGray
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(data: Article) {
        titleLabel.text = data.title
        authorLabel.text = data.author
        dateLabel.text = data.publishedAt
        saveButton.isSelected = data.isFavourite
        if let imageUrl = data.urlToImage,
           let url = URL(string: imageUrl) {
            contentImageView.kf.setImage(with: url)
        }
    }
    
    private func setupViews() {
        saveButton.addTarget(self, action: #selector(saveAction(_:)), for: .touchUpInside)

        [contentImageView,
         titleLabel,
         authorLabel,
         saveButton,
         dateLabel
        ].forEach({
            contentView.addSubview($0)
        })
        
        contentImageView.snp.makeConstraints({
            $0.left.top.equalTo(LayoutGuidance.offsetHalf)
            $0.bottom.equalTo(-LayoutGuidance.offsetHalf)
            $0.height.equalTo(80)
            $0.width.equalTo(120)
        })
        titleLabel.snp.makeConstraints({
            $0.left.equalTo(contentImageView.snp.right)
                .offset(LayoutGuidance.offset)
            $0.right.equalTo(saveButton.snp.left).offset(-LayoutGuidance.offsetHalf)
            $0.top.equalTo(LayoutGuidance.offsetHalf)
        })
        authorLabel.snp.makeConstraints({
            $0.left.right.equalTo(titleLabel)
            $0.top.equalTo(titleLabel.snp.bottom)
                .offset(LayoutGuidance.offsetHalf)
        })
        saveButton.snp.makeConstraints({
            $0.right.equalTo(-LayoutGuidance.offsetHalf)
            $0.top.equalToSuperview().offset(-2)
            $0.width.equalTo(25)
            $0.height.equalTo(50)
        })
        dateLabel.snp.makeConstraints({
            $0.left.right.equalTo(titleLabel)
            $0.top.equalTo(authorLabel.snp.bottom)
                .offset(LayoutGuidance.offsetHalf)
        })

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @objc private func saveAction(_ sender: UIButton) {
        saveClosure?(sender.isSelected)
        sender.isSelected.toggle()
    }
}
