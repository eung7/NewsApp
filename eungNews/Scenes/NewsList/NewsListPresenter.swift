//
//  NewsListPresenter.swift
//  eungNews
//
//  Created by 김응철 on 2022/03/08.
//

import Foundation
import SnapKit
import UIKit
import TTGTags

protocol NewsListProtocol : AnyObject {
    
    func setupNaviationBar()
    func setupLayout()
    func endRefreshControl()
    func moveToNewsWebViewController(with news : News)
    func reloadTableView()
}

final class NewsListPresenter : NSObject {
    private weak var viewController : NewsListProtocol?
    private let newsSearchManager : NewsSearchManagerProtocol
    
    private var currentKeyword = ""
    
    private var tags : [String] = ["주식", "코로나", "부동산", "IT", "경제", "리빙", "앱개발", "강남", "스타트업"]
    
    private var currentPage : Int = 0
    
    private let display : Int = 20
    
    private var newsList : [News] = []
    
    init(
        viewController : NewsListProtocol,
        newsSearchManager : NewsSearchManagerProtocol = NewsSearchManager()
    ) {
        self.viewController = viewController
        self.newsSearchManager = newsSearchManager
    }
    
    func viewDidLoad() {
        viewController?.setupNaviationBar()
        viewController?.setupLayout()
    }
    
    func didCalledRefreshControl() {
        requestNewsList(isNeededToReset: true)
    }
}

extension NewsListPresenter : NewsListTableHeaderViewDelegate {
    
    func didSelectedTag(_ selectedIndex: Int) {
        currentKeyword = tags[selectedIndex]
        requestNewsList(isNeededToReset: true)
    }
}

extension NewsListPresenter : UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsListTableViewCell.identifier, for: indexPath) as? NewsListTableViewCell
        
        let news = newsList[indexPath.row]
        cell?.setup(news: news)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: NewsListTableHeaderView.identifier) as? NewsListTableHeaderView
        header?.setup(tags: tags, delegate: self)
        
        return header ?? UIView()
    }
}

extension NewsListPresenter : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = newsList[indexPath.row]
        viewController?.moveToNewsWebViewController(with: news)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let currentRow = indexPath.row
        
        guard
            (currentRow % 20) == display - 3 && (currentRow / display) == (currentPage - 1)
        else {
            return
        }
        
        requestNewsList(isNeededToReset: false)
    }
}

private extension NewsListPresenter {
    func requestNewsList(isNeededToReset : Bool) {
        if isNeededToReset {
            currentPage = 0
            newsList = []
        }
        
        newsSearchManager.request(
            from: currentKeyword,
            display: display,
            start: (currentPage * display + 1)
        ) { [weak self] newValue in
            self?.newsList += newValue
            self?.currentPage += 1
            self?.viewController?.reloadTableView()
            self?.viewController?.endRefreshControl()
        }
    }
}
