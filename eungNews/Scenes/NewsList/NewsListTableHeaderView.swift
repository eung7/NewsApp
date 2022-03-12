//
//  NewsListTableHeaderView.swift
//  eungNews
//
//  Created by 김응철 on 2022/03/10.
//

import TTGTags
import UIKit
import SnapKit

final class NewsListTableHeaderView : UITableViewHeaderFooterView {
    
    static let identifier = "NewsListTableHeaderView"
    
    private var tags : [String] = ["주식", "코로나", "부동산", "IT", "경제", "리빙", "앱개발", "강남", "스타트업"]
    
    private lazy var tagCollectionView = TTGTextTagCollectionView()
    
    func setup() {
        setupTagCollectionViewLayout()
        setupTagCollectionView()
    }
}

extension NewsListTableHeaderView : TTGTextTagCollectionViewDelegate {
    
    func textTagCollectionView(
        _ textTagCollectionView: TTGTextTagCollectionView!,
        didTap tag: TTGTextTag!,
        at index: UInt
    ) {
        guard tag.selected else { return }
        
        print(tags[Int(index)])
    }
}

private extension NewsListTableHeaderView {
    
    func setupTagCollectionViewLayout() {
        addSubview(tagCollectionView)
        
        tagCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func setupTagCollectionView() {
        tagCollectionView.delegate = self
        tagCollectionView.numberOfLines = 1
        tagCollectionView.scrollDirection = .horizontal
        tagCollectionView.showsHorizontalScrollIndicator = false
        tagCollectionView.selectionLimit = 1
        
        let insetValue : CGFloat = 16.0
        tagCollectionView.contentInset = UIEdgeInsets(
            top: insetValue,
            left: insetValue,
            bottom: insetValue,
            right: insetValue
        )
        
        let cornerRadiusValue : CGFloat = 12.0
        let shadowOpacity : CGFloat = 0.0
        let extraSpace = CGSize(width: 20.0, height: 12.0)
        let color = UIColor.systemOrange

        let style = TTGTextTagStyle()
        style.backgroundColor = color
        style.cornerRadius = cornerRadiusValue
        style.borderWidth = 0.0
        style.shadowOpacity = shadowOpacity
        style.extraSpace = extraSpace
        
        let selectedStyle = TTGTextTagStyle()
        selectedStyle.backgroundColor = .white
        selectedStyle.cornerRadius = cornerRadiusValue
        selectedStyle.shadowOpacity = shadowOpacity
        selectedStyle.extraSpace = extraSpace
        selectedStyle.borderColor = color
        
        tags.forEach { tag in
            let font = UIFont.systemFont(ofSize: 14.0, weight: .semibold)
            let tagContents = TTGTextTagStringContent(
                text: tag,
                textFont: font,
                textColor: .white
            )
            let selectedTagContents = TTGTextTagStringContent(
                text: tag,
                textFont: font,
                textColor: color
            )
            
            let tag = TTGTextTag(
                content: tagContents,
                style: style,
                selectedContent: selectedTagContents,
                selectedStyle: selectedStyle
            )
            
            tagCollectionView.addTag(tag)
        }
    }
}
