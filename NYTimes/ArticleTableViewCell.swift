//
//  ArticleTableViewCell.swift
//  NYTimes
//
//  Created by Александр Сапрыкин on 14.10.2021.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
	
	var titleLabel: UILabel!
	var publishedDateLabel: UILabel!
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		titleLabel = UILabel()
		titleLabel.numberOfLines = 0
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		addSubview(titleLabel)
		titleLabel.snp.makeConstraints { make in
			make.leading.top.equalToSuperview().offset(16)
			make.trailing.equalToSuperview().offset(-16)
		}
		
		publishedDateLabel = UILabel()
		publishedDateLabel.textColor = .systemGray
		publishedDateLabel.translatesAutoresizingMaskIntoConstraints = false
		addSubview(publishedDateLabel)
		publishedDateLabel.snp.makeConstraints { make in
			make.top.equalTo(titleLabel.snp.bottom).offset(16)
			make.leading.equalToSuperview().offset(16)
			make.trailing.bottom.equalToSuperview().offset(-16)
		}
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
