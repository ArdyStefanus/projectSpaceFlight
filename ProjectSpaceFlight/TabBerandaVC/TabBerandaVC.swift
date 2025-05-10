//
//  TabBerandaVC.swift
//  ProjectSpaceFlight
//
//  Created by Macbook Pro on 09/05/25.
//

import UIKit

class TabBerandaVC: UIViewController {
    
    @IBOutlet weak var labelGreeting: UILabel!
    @IBOutlet weak var viewTappedArticle: UIView!
    @IBOutlet weak var viewTappedBlog: UIView!
    @IBOutlet weak var viewTappedReport: UIView!
    
    let vm = TabBerandaVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapArticle = UITapGestureRecognizer(target: self, action: #selector(handleTapArticle))
        viewTappedArticle.addGestureRecognizer(tapArticle)
        
        let tapBlog = UITapGestureRecognizer(target: self, action: #selector(handleTapBlog))
        viewTappedBlog.addGestureRecognizer(tapBlog)

        let tapReport = UITapGestureRecognizer(target: self, action: #selector(handleTapReport))
        viewTappedReport.addGestureRecognizer(tapReport)
        
        labelGreeting.text = vm.getGreeting()
    }
    
    @objc func handleTapArticle() {
        let vc = ListArticleVC(nibName: NibFile.LIST_ARTICLE, bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleTapBlog() {
        let vc = ListBlogVC(nibName: NibFile.LIST_BLOG, bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleTapReport() {
        let vc = ListReportVC(nibName: NibFile.LIST_REPORT, bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
}
