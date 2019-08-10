//
//  DetailViewModel.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 10.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation

class DetailViewModel: BaseViewModel {
    
    private var searchModel : SearchModel?
    
    init(searchModel : SearchModel) {
        super.init()
        self.searchModel = searchModel
        print(searchModel)
    }
    func getSearchModel() ->SearchModel?{
        return searchModel
    }
    override func getTitleNavigationBar() -> String? {
        return GlobalConstant.NavigationBar.detailViewController
    }
    
}

