//
//  ViewController.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 8.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    lazy var  searchView : SearchView = {
        let view = SearchView(frame: .zero)
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    lazy var searchViewModel : SearchViewModel = {
        let viewModel = SearchViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }

    //MARK:SetupFunctions
    override func setupView() {
        super.setupView()
        setupNavigationBar()
        setupAddView()
        setupAddConstraint()
        setupStyleView()
    }
    override func setupNavigationBar() {
        super.setupNavigationBar()
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        
        title = searchViewModel.getTitleNavigationBar()
    }
    override func setupAddView() {
        super.setupAddView()
        view.addSubview(searchView)
    }
    override func setupAddConstraint() {
        super.setupAddConstraint()
        searchView.fillSuperView()
    }
    override func setupStyleView() {
        super.setupStyleView()
        
    }
    
}

extension SearchViewController : UISearchBarDelegate {
    
    //MARK:UISearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        print(searchText)
        searchViewModel.startSearchBarTextDidChange()
        searchView.reloadTableView()
        searchViewModel.changeSearchText(searchText: searchText)
    }
    
}
extension SearchViewController : SearchViewModelDelegate  , SearchViewDataSource  , SearchViewDelegate{
    
    //MARK:SearchViewDelegate
    func onClickedCellWith(index: Int, sender: UITableViewCell) {
        
    }
    
    //MARK:SearchViewDataSource
    func allSearchModel() -> [SearchModel]? {
        return searchViewModel.getAllSearchModels()
    }
    
    func isEmptySearchBar() -> Bool {
       return searchController.searchBar.text?.isEmpty ?? false
    }
    
    //MARK:SearchViewModelDelegate
    func errorGetSearchModels(errorMessage: String?) {
        print("errorGetSearchModels" , errorMessage ?? "")
    }
    func successGetSearchModels() {
        searchView.reloadTableView()
    }
    
}
