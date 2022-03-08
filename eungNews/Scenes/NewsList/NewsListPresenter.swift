//
//  NewsListPresenter.swift
//  eungNews
//
//  Created by 김응철 on 2022/03/08.
//

import Foundation

protocol NewsListProtocol : AnyObject {
    func setupNaviationBar()
    func setupTableView()
}

final class NewsListPresenter {
    private weak var viewController : NewsListProtocol?
    
    init(viewController : NewsListProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController?.setupNaviationBar()
        viewController?.setupTableView()
    }
}
