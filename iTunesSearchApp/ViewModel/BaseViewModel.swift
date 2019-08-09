//
//  BaseViewModel.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 8.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation


class BaseViewModel: NSObject {
    
    override init() {
        super.init()
        setupInit()
    }
    internal func setupInit(){
        
    }
    internal func getTitleNavigationBar()->String? {
        
        return "BaseViewModelString"
    }
    
}
