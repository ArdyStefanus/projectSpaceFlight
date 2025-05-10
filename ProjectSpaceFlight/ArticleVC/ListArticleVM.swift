//
//  ListArticleVM.swift
//  ProjectSpaceFlight
//
//  Created by Macbook Pro on 10/05/25.
//

class ListArticleVM {
    let listArticleService = ArticleListService.shared
    var loading: Observable<Bool> = Observable(false)
    var arrListArticle: Observable<[ArticleBlog]> = Observable([])
    var searchFilterArticle: Observable<[ArticleBlog]> = Observable([])
    
    func getAvailableArticleList() {
        self.loading.value = true
        listArticleService.getAvailableListArticle { [unowned self] (data) in
            self.arrListArticle.value = []
            for i in 0 ..< data.count {
                self.arrListArticle.value.append(ArticleBlog.init(data: data[i]))
            }
            self.loading.value = false
        }
    }
}
