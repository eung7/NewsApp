//
//  NewsListViewController.swift
//  eungNews
//
//  Created by 김응철 on 2022/03/08.
//

import Foundation
import UIKit
import SnapKit

final class NewsListViewController : UIViewController {
    
    private lazy var presenter = NewsListPresenter(viewController: self)
    
    private lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.delegate = presenter
        tableView.dataSource = presenter
        tableView.register(NewsListTableHeaderView.self, forHeaderFooterViewReuseIdentifier: NewsListTableHeaderView.identifier)
        tableView.register(NewsListTableViewCell.self, forCellReuseIdentifier: NewsListTableViewCell.identifier)
        
        return tableView
    }()
    
    private lazy var tableHeaderView : UITableViewHeaderFooterView  = {
        let header = UITableViewHeaderFooterView()
        
        return header
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension NewsListViewController : NewsListProtocol {
    
    func setupNaviationBar() {
        navigationItem.title = "NEWS"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupLayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
