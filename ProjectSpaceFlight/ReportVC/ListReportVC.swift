//
//  ListReportVC.swift
//  ProjectSpaceFlight
//
//  Created by Macbook Pro on 10/05/25.
//

import UIKit

class ListReportVC: UIViewController {

    @IBOutlet weak var searchReport: UISearchBar!
    @IBOutlet weak var tableViewReport: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    let vm = ListReportVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        vm.getAvailableReportList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func back(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func setupView(){
        searchReport.resignFirstResponder()
        searchReport.isUserInteractionEnabled = true
        searchReport.delegate = self
        tableViewReport.delegate = self
        tableViewReport.dataSource = self
        tableViewReport.register(UINib.init(nibName: NibFile.LIST_CELL, bundle: nil), forCellReuseIdentifier: NibFile.LIST_CELL)
        
        bind()
    }
    
    func bind() {
        vm.loading.bind { [weak self] loading in
            if loading { self?.loadingIndicator.startAnimating() }
            else { self?.loadingIndicator.stopAnimating() }
        }
        
        vm.arrListReport.bind { [unowned self] (_) in
            vm.searchFilterReport.value = vm.arrListReport.value
            tableViewReport.reloadData()
        }
    }
}

extension ListReportVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.searchFilterReport.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NibFile.LIST_CELL, for: indexPath) as! ListArticleBlogCell
        let data = vm.searchFilterReport.value[indexPath.row]
        cell.setupCell(data: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailReportVC(nibName: NibFile.DETAIL_REPORT, bundle: nil)
        vc.vm.detailListReport = vm.searchFilterReport.value[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ListReportVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            vm.searchFilterReport.value = vm.arrListReport.value
        } else {
            vm.searchFilterReport.value = vm.arrListReport.value.filter {                $0.title.lowercased().contains(searchText.lowercased())
            }
            tableViewReport.reloadData()
        }
    }
}
