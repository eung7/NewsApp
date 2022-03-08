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
        tableView.dataSource = self
        
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
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension NewsListViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .red
        
        return cell
    }
}

