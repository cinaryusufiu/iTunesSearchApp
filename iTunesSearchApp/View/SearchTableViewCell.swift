//
//  SearchTableViewCell.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 9.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation

class SearchTableViewCell: BaseTableViewCell {
    
    static let cellId = "SearchTableViewCellId"
    
    var searchModel : SearchModel?{
        didSet{
            guard let searchModel = self.searchModel else { return }
            print(searchModel.artistName ??  "" )
        }
    }
    
    //MARK:SetupFunctions
    override func setupView() {
        super.setupView()
        setupAddView()
        setupAddConstraint()
        setupStyleView()
    }
    override func setupAddView() {
        super.setupAddView()
        
    }
    override func setupAddConstraint() {
        super.setupAddConstraint()
        
    }
    override func setupStyleView() {
        super.setupStyleView()
        
    }
}
