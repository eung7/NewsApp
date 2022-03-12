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
        tableView.register(NewsListTableViewCell.self, forCellReuseIdentifier: NewsListTableViewCell.identifier)
        tableView.register(NewsListTableHeaderView.self, forHeaderFooterViewReuseIdentifier: NewsListTableHeaderView.identifier)
        tableView.refreshControl = refreshControl
        
        return tableView
    }()
    
    private lazy var refreshControl : UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(didCalledRefreshControl), for: .valueChanged)
        
        return refreshControl
    }()
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        presenter.viewDidLoad()
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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

    func endRefreshControl() {
        self.refreshControl.endRefreshing()
    }
    
    func moveToNewsWebViewController() {
        let newsWebViewController = NewsWebViewController()
        
        navigationController?.pushViewController(newsWebViewController, animated: true)
    }
}

private extension NewsListViewController {
    
    @objc func didCalledRefreshControl() {
        presenter.didCalledRefreshControl()
    }
}

