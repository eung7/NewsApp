//
//  NewsResponseModel.swift
//  eungNews
//
//  Created by 김응철 on 2022/03/12.
//

import Foundation

struct NewsResponseModel : Decodable {
    
    var items : [News] = []
}

struct News : Decodable {
    let title : String
    let link : String
    let description : String
    let pubDate : String
}
