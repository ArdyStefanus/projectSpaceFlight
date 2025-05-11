//
//  ListBlogVC.swift
//  ProjectSpaceFlight
//
//  Created by Macbook Pro on 10/05/25.
//

import UIKit

class ListBlogVC: UIViewController {

    @IBOutlet weak var searchBlog: UISearchBar!
    @IBOutlet weak var tableViewBlog: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    let vm = ListBlogVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        vm.getAvailableBlogList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func back(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func setupView(){
        searchBlog.resignFirstResponder()
        searchBlog.isUserInteractionEnabled = true
        searchBlog.delegate = self
        tableViewBlog.delegate = self
        tableViewBlog.dataSource = self
        tableViewBlog.register(UINib.init(nibName: NibFile.LIST_CELL, bundle: nil), forCellReuseIdentifier: NibFile.LIST_CELL)
        
        bind()
    }
    
    func bind() {
        vm.loading.bind { [weak self] loading in
            if loading { self?.loadingIndicator.startAnimating() }
            else { self?.loadingIndicator.stopAnimating() }
        }
        
        vm.arrListBlog.bind { [unowned self] (_) in
            vm.searchFilterBlog.value = vm.arrListBlog.value
            tableViewBlog.reloadData()
        }
    }
}

extension ListBlogVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.searchFilterBlog.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NibFile.LIST_CELL, for: indexPath) as! ListArticleBlogCell
        let data = vm.searchFilterBlog.value[indexPath.row]
        cell.setupCell(data: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailBlogVC(nibName: NibFile.DETAIL_BLOG, bundle: nil)
        vc.vm.detailListBlog = vm.searchFilterBlog.value[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ListBlogVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            vm.searchFilterBlog.value = vm.arrListBlog.value
        } else {
            vm.searchFilterBlog.value = vm.arrListBlog.value.filter {                $0.title.lowercased().contains(searchText.lowercased())
            }
            tableViewBlog.reloadData()
        }
    }
}
