//
//  SearchViewModel.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 8.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation

protocol SearchViewModelDelegate : NSObjectProtocol {
    func errorGetSearchModels(errorMessage:String?)
    func successGetSearchModels()
}
enum MediaType : String {
    case movie
    case podcast
    case music
    case musicVideo
    case all
}
class SearchViewModel: BaseViewModel {
    
    weak var delegate : SearchViewModelDelegate?
    
    private var responseModel: ResponseModel<SearchModel>?{
        didSet{
            guard let searchModels = self.responseModel?.results  else { return }
            self.searchModels.removeAll()
            self.searchModels.append(contentsOf:searchModels)
        }
    }
    
    private var searchModels:[SearchModel] = [SearchModel]()
    
    fileprivate var operationQueue : OperationQueue = OperationQueue()
    
    private var searchText : String?
    
    private var selectedMediaType :MediaType = .all
    
    override func setupInit() {
        super.setupInit()
        // nothing
    }
    
    func getAllSearchModels()->[SearchModel]?{
        return searchModels
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
}
