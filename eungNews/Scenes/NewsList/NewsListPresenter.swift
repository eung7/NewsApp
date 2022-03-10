//
//  NewsListPresenter.swift
//  eungNews
//
//  Created by 김응철 on 2022/03/08.
//

import Foundation
import UIKit

protocol NewsListProtocol : AnyObject {
    
    func setupNaviationBar()
    func setupLayout()
    func endRefreshControl()
}

final class NewsListPresenter :NSObject {
    private weak var viewController : NewsListProtocol?
    
    init(viewController : NewsListProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController?.setupNaviationBar()
        viewController?.setupLayout()
    }
    
    func didCalledRefreshControl() {
        viewController?.endRefreshControl()
    }
    
}

extension NewsListPresenter : UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsListTableViewCell.identifier, for: indexPath) as? NewsListTableViewCell
        cell?.setup()
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: NewsListTableHeaderView.identifier) as? NewsListTableHeaderView
        header?.setup()
        
        return header ?? UIView()
    }
}

extension NewsListPresenter : UITableViewDelegate {
    
}

