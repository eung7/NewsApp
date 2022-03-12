//
//  NewsRequestModel.swift
//  eungNews
//
//  Created by 김응철 on 2022/03/12.
//

import Foundation

struct NewsRequestModel : Codable {
    
    /// 시작 Index, 1 ~ 1000
    let query : String
    /// 검색 결과 출력 건수, 10 ~ 100
    let display : Int
    /// 검색어
    let start : Int
}



