//
//  DetailViewModel.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 10.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation

protocol DetailViewModelDelegate : NSObjectProtocol {
    func reloadView()
}
class DetailViewModel: BaseViewModel {
    
    weak var delegate :DetailViewModelDelegate?{
        didSet{
            guard let delegate = self.delegate else { return }
            delegate.reloadView()
        }
    }
    
    private var searchModel : SearchModel?
    
    init(searchModel : SearchModel) {
        self.searchModel = searchModel
        super.init()
        print(searchModel)
    }
    func getSearchModel() ->SearchModel? {
        return searchModel
    }
    override func getTitleNavigationBar() -> String? {
        return GlobalConstant.NavigationBar.detailViewController
    }
    
}

