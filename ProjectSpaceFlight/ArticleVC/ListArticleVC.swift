//
//  ListArticleVC.swift
//  ProjectSpaceFlight
//
//  Created by Macbook Pro on 10/05/25.
//

import UIKit

class ListArticleVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableViewListArticle: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!

    let vm = ListArticleVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        vm.getAvailableArticleList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func back(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func setupView(){
        searchBar.resignFirstResponder()
        searchBar.isUserInteractionEnabled = true
        searchBar.delegate = self
        tableViewListArticle.delegate = self
        tableViewListArticle.dataSource = self
        tableViewListArticle.register(UINib.init(nibName: NibFile.LIST_CELL, bundle: nil), forCellReuseIdentifier: NibFile.LIST_CELL)
        
        bind()
    }
    
    func bind() {
        vm.loading.bind { [weak self] loading in
            if loading { self?.loadingIndicator.startAnimating() }
            else { self?.loadingIndicator.stopAnimating() }
        }
        
        vm.arrListArticle.bind { [unowned self] (_) in
            vm.searchFilterArticle.value = vm.arrListArticle.value
            tableViewListArticle.reloadData()
        }
    }
}

extension ListArticleVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.searchFilterArticle.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NibFile.LIST_CELL, for: indexPath) as! ListArticleBlogCell
        let data = vm.searchFilterArticle.value[indexPath.row]
        cell.setupCell(data: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailArticleVC(nibName: NibFile.DETAIL_ARTICLE, bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ListArticleVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            vm.searchFilterArticle.value = vm.arrListArticle.value
        } else {
            vm.searchFilterArticle.value = vm.arrListArticle.value.filter {                $0.title.lowercased().contains(searchText.lowercased())
            }
            tableViewListArticle.reloadData()
        }
    }
}
