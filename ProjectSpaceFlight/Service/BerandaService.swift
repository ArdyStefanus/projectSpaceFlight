//
//  BerandaService.swift
//  ProjectSpaceFlight
//
//  Created by Macbook Pro on 10/05/25.
//

import Alamofire
import SwiftyJSON

class ArticleListService {
    static let shared = ArticleListService()
    
    func getAvailableListArticle(completion: @escaping ([JSON]) -> ()) {
        let request: URLRequest = RESTConfig.shared.requestConfig(endpoint: ARTICLE_BASE_SERVER, method: RESTConfig.HTTPMethod.GET, parameters: nil)
        
        AF.request(request).response { response in
            switch response.result {
            case .success:
                let json = JSON(response.data!)
                let data = json["results"].array ?? []
                completion(data)
            case .failure:
                print(response.debugDescription)
            }
        }
    }
}

class BlogListService {
    static let shared = BlogListService()
    
    func getAvailableListBlog(completion: @escaping ([JSON]) -> ()) {
        let request: URLRequest = RESTConfig.shared.requestConfig(endpoint: BLOG_BASE_SERVER, method: RESTConfig.HTTPMethod.GET, parameters: nil)
        
        AF.request(request).response { response in
            switch response.result {
            case .success:
                let json = JSON(response.data!)
                let data = json["results"].array ?? []
                completion(data)
            case .failure:
                print(response.debugDescription)
            }
        }
    }
}

class ReportListService {
    static let shared = ReportListService()
    
    func getAvailableListReport(completion: @escaping ([JSON]) -> ()) {
        let request: URLRequest = RESTConfig.shared.requestConfig(endpoint: REPORT_BASE_SERVER, method: RESTConfig.HTTPMethod.GET, parameters: nil)
        
        AF.request(request).response { response in
            switch response.result {
            case .success:
                let json = JSON(response.data!)
                let data = json["results"].array ?? []
                completion(data)
            case .failure:
                print(response.debugDescription)
            }
        }
    }
}
