//
//  NewsListTableViewCell.swift
//  eungNews
//
//  Created by 김응철 on 2022/03/08.
//

import SnapKit
import UIKit

final class NewsListTableViewCell : UITableViewCell {
    
    static let identifier = "NewsListTableViewCell"
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .semibold)
        label.text = "titleLabel"
        
        return label
    }()
    
    private lazy var descriptionLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        label.text = "descriptionLabel"
        
        return label
    }()
    
    private lazy var dateLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12.0, weight: .medium)
        label.textColor = .secondaryLabel
        label.text = "dateLabel"
        
        return label
    }()

    func setup() {
        [ titleLabel, descriptionLabel, dateLabel ]
            .forEach { addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16.0)
            $0.leading.equalToSuperview().inset(16.0)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4.0)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(4.0)
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.bottom.equalToSuperview().inset(16.0)
        }
    }
}





