//
//  ListReportVM.swift
//  ProjectSpaceFlight
//
//  Created by Macbook Pro on 10/05/25.
//

class ListReportVM {
    let listReportService = ReportListService.shared
    var loading: Observable<Bool> = Observable(false)
    var arrListReport: Observable<[NewsArticle]> = Observable([])
    var searchFilterReport: Observable<[NewsArticle]> = Observable([])
    
    func getAvailableReportList() {
        self.loading.value = true
        listReportService.getAvailableListReport { [unowned self] (data) in
            self.arrListReport.value = []
            for i in 0 ..< data.count {
                self.arrListReport.value.append(NewsArticle.init(json: data[i]))
            }
            self.loading.value = false
        }
    }
}
