//
//  NewsWebViewController.swift
//  eungNews
//
//  Created by 김응철 on 2022/03/12.
//

import UIKit
import WebKit
import SnapKit

final class NewsWebViewController : UIViewController {
    
    private let webView = WKWebView()
    
    private let rightBarButtonItem = UIBarButtonItem(
        image: UIImage(systemName: "link"),
        style: .plain,
        target: self,
        action: #selector(didTapRightBarButtonItem)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupNavigationBar()
        setupWebView()
    }
}

private extension NewsWebViewController {
    
    func setupNavigationBar() {
        navigationItem.title = "기사제목"
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func setupWebView() {
        guard let linkURL = URL(string: "https://www.naver.com/") else {
            navigationController?.popViewController(animated: true)
            return
        }
        let urlRequest = URLRequest(url: linkURL)
        
        view = webView
        webView.load(urlRequest)
    }
    
    @objc func didTapRightBarButtonItem() {
        UIPasteboard.general.string = "뉴스 링크"
    }
}


