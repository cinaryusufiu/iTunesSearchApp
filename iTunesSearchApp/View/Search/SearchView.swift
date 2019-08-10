//
//  SearchView.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 9.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation
import UIKit

protocol SearchViewDataSource : NSObjectProtocol {
    func allSearchModel() -> [SearchModel]?
    func isEmptySearchBar() -> Bool
    func countSearchBar()->Int
}
protocol SearchViewDelegate : NSObjectProtocol {
    func onClickedCellWith(index : Int , sender : SearchTableViewCell)
}
class SearchView: BaseView {
    
    weak var delegate : SearchViewDelegate?
    weak var dataSource : SearchViewDataSource?
    
    private lazy var tableView : UITableView = {
        let tb = UITableView(frame: .zero, style: .plain)
        tb.delegate = self
        tb.dataSource = self
        tb.keyboardDismissMode = .onDrag
        tb.separatorStyle = .none
        return tb
    }()
    
    //MARK:SetupFunctions
    override func setupView() {
        super.setupView()
        setupAddView()
        setupAddConstraint()
        setupStyleView()
        setupTableView()
    }
    override func setupAddView() {
        super.setupAddView()
        addSubview(tableView)
    }
    override func setupAddConstraint() {
        super.setupAddConstraint()
        tableView.fillSafeAreaSuperView()
    }
    override func setupTableView() {
        super.setupTableView()
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.cellId)
    }
    override func setupStyleView() {
        super.setupStyleView()
        
    }
    //MARK:OutSide-func
    func reloadTableView(){
        tableView.reloadData()
    }
}
extension SearchView : UITableViewDelegate , UITableViewDataSource {
    
    //MARK:UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource?.allSearchModel()?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.cellId, for: indexPath) as! SearchTableViewCell
        cell.searchModel = self.dataSource?.allSearchModel()?[indexPath.row]
        return cell
    }
    
    //MARK:UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 132
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt")
        guard let delegate = self.delegate else { return }
        let cell = tableView.cellForRow(at: indexPath) as! SearchTableViewCell
        delegate.onClickedCellWith(index: indexPath.row, sender: cell)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let dataSource = self.dataSource else { return 0 }
        
        let isValid = dataSource.allSearchModel()?.isEmpty ?? false && (dataSource.isEmptySearchBar() == true || dataSource.countSearchBar() < 3)
        return isValid ? 400 : 0
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard let dataSource = self.dataSource else { return 0 }
        
        let isValid = dataSource.allSearchModel()?.isEmpty ?? false && dataSource.isEmptySearchBar() == false && dataSource.countSearchBar() >= 3
        return isValid ? 400 : 0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let emptyViewPage = EmptyViewPage(frame: .zero)
        emptyViewPage.countSearchText = dataSource?.countSearchBar()
        return emptyViewPage
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let searchLoadingView = SearchLoadingView(frame:.zero)
        return searchLoadingView
    }
    
}
