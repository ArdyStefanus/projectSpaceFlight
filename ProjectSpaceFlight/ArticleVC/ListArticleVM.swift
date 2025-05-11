//
//  ListArticleVM.swift
//  ProjectSpaceFlight
//
//  Created by Macbook Pro on 10/05/25.
//

class ListArticleVM {
    let listArticleService = ArticleListService.shared
    var loading: Observable<Bool> = Observable(false)
    var arrListArticle: Observable<[NewsArticle]> = Observable([])
    var searchFilterArticle: Observable<[NewsArticle]> = Observable([])
    
    func getAvailableArticleList() {
        self.loading.value = true
        listArticleService.getAvailableListArticle { [unowned self] (data) in
            self.arrListArticle.value = []
            for i in 0 ..< data.count {
                self.arrListArticle.value.append(NewsArticle.init(json: data[i]))
            }
            self.loading.value = false
        }
    }
}
