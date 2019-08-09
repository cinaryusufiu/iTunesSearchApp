//
//  BaseTableViewCell.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 9.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation
import UIKit

class BaseTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension BaseTableViewCell : SetupFunctions {
    
    //MARK:SetupFunctions
    internal func setupView() {
        
    }
    internal func setupAddView() {
        
    }
    internal func setupAddConstraint() {
        
    }
    internal func setupStyleView() {
        
    }
    internal func setupTableView() {
        
    }
    internal func setupCollectionView() {
        
    }
}
