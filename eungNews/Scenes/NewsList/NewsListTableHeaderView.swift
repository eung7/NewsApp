//
//  NewsListTableHeaderView.swift
//  eungNews
//
//  Created by 김응철 on 2022/03/08.
//

import UIKit
import SnapKit

final class NewsListTableHeaderView : UITableViewHeaderFooterView {
    
    static let identifier = "NewsListTableHeaderView"
    
    private lazy var button : UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "해윙"
        button.titleLabel?.textColor = .white
        button.tintColor = .red
        
        button.layer.cornerRadius = 3.0
        
        return button
    }()
    
    func setup() {
        addSubview(button)
        
        button.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
