//
//  ListBlocgVM.swift
//  ProjectSpaceFlight
//
//  Created by Macbook Pro on 10/05/25.
//

class ListBlogVM {
    let listBlogService = BlogListService.shared
    var loading: Observable<Bool> = Observable(false)
    var arrListBlog: Observable<[NewsArticle]> = Observable([])
    var searchFilterBlog: Observable<[NewsArticle]> = Observable([])
    
    func getAvailableBlogList() {
        self.loading.value = true
        listBlogService.getAvailableListBlog { [unowned self] (data) in
            self.arrListBlog.value = []
            for i in 0 ..< data.count {
                self.arrListBlog.value.append(NewsArticle.init(json: data[i]))
            }
            self.loading.value = false
        }
    }
}
