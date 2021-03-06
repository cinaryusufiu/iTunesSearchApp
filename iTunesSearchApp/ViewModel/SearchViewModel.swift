//
//  SearchViewModel.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 8.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation
import UIKit

protocol SearchViewModelDelegate : NSObjectProtocol {
    func errorGetSearchModels(errorMessage:String?)
    func successGetSearchModels()
    func showDetailViewController(detailViewModel : DetailViewModel)
}
enum MediaType : String , CaseIterable {
    case all
    case movie
    case podcast
    case music
    case musicVideo
    case audiobook
    case shortFilm
    case tvShow
    case software
    case ebook
}
class SearchViewModel: BaseViewModel {
    
    private var mediaTypes = MediaType.allCases
    
    weak var delegate : SearchViewModelDelegate?
    
    private var searchModels:[SearchModel] = [SearchModel]()
    
    private var responseModel: ResponseModel<SearchModel>?{
        didSet{
            guard let searchModels = self.responseModel?.results  else { return }
            self.searchModels.removeAll()
            self.searchModels.append(contentsOf:searchModels)
            UserDefaults.standard.saveSearchModels(searchModels: searchModels)
        }
    }
    
    fileprivate var operationQueue : OperationQueue = OperationQueue()
    
    private var searchText : String?{
        didSet{
            reloadFilterOptionModel()
        }
    }
    private var selectedMediaType :MediaType = .all{
        didSet{
            reloadFilterOptionModel()
        }
    }
    override func setupInit() {
        super.setupInit()
        
        if let searchModels = UserDefaults.standard.getSearchModels(){
            self.searchModels.append(contentsOf: searchModels)
        }
        let filterOptionModel = UserDefaults.standard.getFilterOptionModel()
        self.searchText = filterOptionModel.term
        
        self.selectedMediaType = mediaTypes[filterOptionModel.mediaType ?? 0]
    }
    
    func getAllSearchModels()->[SearchModel]?{
        return searchModels
    }
    func getAllMediaTypes()->[MediaType]?{
        return self.mediaTypes
    }
    func getSelectedMediaType()->Int{
        print("selected media Type index : " ,mediaTypes.firstIndex(of: selectedMediaType) ?? 0)
        return mediaTypes.firstIndex(of: selectedMediaType) ?? 0
    }
    func setSelectedMediaType(index : Int){
        if index < 0 || index >= mediaTypes.count{
            return
        }
        selectedMediaType = mediaTypes[index]
        startSearchOrganization()
    }
    func startSearchBarTextDidChange(){
        self.searchModels.removeAll()
    }
    
    func changeSearchText(searchText : String){
        self.searchText = searchText
        operationQueue.cancelAllOperations()
        createOperationAndAddOperationQueue()
    }
    fileprivate func createOperationAndAddOperationQueue() {
        let operation = BlockOperation()
        operation.addExecutionBlock { [weak self]in
            sleep(UInt32(0.5))
            if operation.isCancelled {
                return
            }
            self?.startSearchOrganization()
        }
        operationQueue.addOperation(operation)
    }
    fileprivate func startSearchOrganization(){

        guard let term = searchText , term.count >= 3 else { return  }
        
        self.getApiResultSearchModel(term: term)
    }
    fileprivate func getApiResultSearchModel(term : String){
        APIClient.shared.requestJSON(SearchRouter(endPoint: .searchWithTerm(term: term ,  mediaType:selectedMediaType.rawValue))) { [weak self](response, error) in
            
            guard let responseData = response?.data , error == nil else {
                self?.delegate?.errorGetSearchModels(errorMessage: error?.localizedDescription ?? "")
                return
            }
            do {
                let responseModel = try JSONDecoder().decode(ResponseModel<SearchModel>.self, from: responseData)
                self?.responseModel = responseModel
                self?.delegate?.successGetSearchModels()
            } catch let err {
                self?.delegate?.errorGetSearchModels(errorMessage: err.localizedDescription)
            }
        }
    }
    override func getTitleNavigationBar() -> String? {
        return GlobalConstant.NavigationBar.searchViewController
    }
    
    fileprivate func reloadFilterOptionModel(){
        var filterOptionModel = UserDefaults.standard.getFilterOptionModel()
        if  self.searchText?.count ?? 0 >= 3 {
            filterOptionModel.term = searchText
        }
        filterOptionModel.mediaType = mediaTypes.firstIndex(of: selectedMediaType) ?? 0
        UserDefaults.standard.saveFilterOptionModel(filterOptionModel: filterOptionModel)
    }
}

extension SearchViewModel :SearchViewDelegate {
    
    func onClickedCellWith(index: Int, sender: SearchTableViewCell) {
       
        if index < 0 || index >= searchModels.count{
            return
        }
        searchModels[index].isClicked = true
        UserDefaults.standard.saveSearchModels(searchModels: searchModels)
        
        sender.searchModel = searchModels[index]
        let detailViewModel = DetailViewModel(searchModel:searchModels[index])
        delegate?.showDetailViewController(detailViewModel:detailViewModel)
    }
    
    
}
