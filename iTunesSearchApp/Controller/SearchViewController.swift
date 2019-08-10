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
    
    lazy var searchView : SearchView = {
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
    
    lazy var customPopUpView : CustomPopUpView = {
        let view = CustomPopUpView(frame: .zero, mainView: self.view)
        view.delegate = self
        view.dataSource = self
        return view
    }()
    lazy var filterView : FilterView = {
       let view = FilterView(frame: .zero)
        view.delegate = self
        view.dataSource = self
        return view
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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(handleOpenFilterView))
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
    @objc func handleOpenFilterView() {
        customPopUpView.openPopUpMessageView()
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
    func countSearchBar() -> Int {
        return searchController.searchBar.text?.count ?? 0
    }
    
    //MARK:SearchViewModelDelegate
    func errorGetSearchModels(errorMessage: String?) {
        print("errorGetSearchModels" , errorMessage ?? "")
    }
    func successGetSearchModels() {
        searchView.reloadTableView()
    }
    
}

extension SearchViewController :CustomPopUpViewDelegate , CustomPopUpViewDataSource , FilterViewDelegate , FilterViewDataSource {
   
    //MARK:FilterViewDelegate
    func onClickedCellWith(index: Int) {
        customPopUpView.closePopUpMessageView()
        searchViewModel.setSelectedMediaType(index: index)
    }
    
    //MARK:FilterViewDataSource
    func getAllMediaType() -> [MediaType]? {
        return searchViewModel.getAllMediaTypes()
    }
    func selectedMediaType() -> Int {
        return searchViewModel.getSelectedMediaType()
    }
    
    //MARK:CustomPopUpViewDelegate
    func customPopUpViewWillOpen(_ customPopUpView: UIView) {
        print("customPopUpViewWillOpen")
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    func customPopUpViewDidOpen(_ customPopUpView: UIView) {
        print("customPopUpViewDidOpen")
    }
    func customPopUpViewWillClose(_ customPopUpView: UIView) {
        print("customPopUpViewWillClose")
         navigationItem.rightBarButtonItem?.isEnabled = true
    }
    func customPopUpViewDidClose(_ customPopUpView: UIView) {
        print("customPopUpViewDidClose")
    }
    
    //MARK: CustomPopUpViewDataSource
    func widhtContainerView() -> CGFloat {
        return view.frame.width - 20
    }
    func heightContainerView() -> CGFloat {
        return 320
    }
    func containerContentView() -> UIView {
        return self.filterView
    }
    func constantContainerContentView() -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}
