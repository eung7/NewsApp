//
//  NewsListTableHeaderView.swift
//  eungNews
//
//  Created by 김응철 on 2022/03/10.
//

import UIKit
import SnapKit

final class NewsListTableHeaderView : UITableViewHeaderFooterView {
    
    static let identifier = "NewsListTableHeaderView"
    
    func setup() {
        contentView.backgroundColor = .red
    }
}

