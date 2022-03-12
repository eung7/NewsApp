//
//  NewsSearchManager.swift
//  eungNews
//
//  Created by 김응철 on 2022/03/12.
//

import Alamofire
import Foundation

protocol NewsSearchManagerProtocol {
    func request(
        from keyword : String,
        display : Int,
        start : Int,
        completionHandler : @escaping ([News]) -> Void
    )
}

struct NewsSearchManager : NewsSearchManagerProtocol {
    func request(
        from keyword : String,
        display : Int,
        start : Int,
        completionHandler : @escaping ([News]) -> Void
    ) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/news.json") else { return }
        
        let parameters = NewsRequestModel(query: keyword, display: display, start: start)
        let headers : HTTPHeaders = [
            "X-Naver-Client-Id" : "MGNKywenELtsPfBL17ur",
            "X-Naver-Client-Secret" : "XAF26UxFoq"
        ]
        
        AF
            .request(url, method: .get, parameters: parameters, headers: headers)
            .responseDecodable(of: NewsResponseModel.self) { response in
                switch response.result {
                case .success(let result) :
                    completionHandler(result.items)
                case .failure(let error) :
                    print(error)
                }
            }
            .resume()
    }
}


