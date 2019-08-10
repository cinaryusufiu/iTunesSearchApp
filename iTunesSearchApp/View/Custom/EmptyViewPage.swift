//
//  EmptyViewPage.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 9.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation
import UIKit

class EmptyViewPage: BaseView {
    
    var countSearchText : Int? {
        didSet{
            guard let count = self.countSearchText else { return }
            if count == 0 {
                descriptionTitleLabel.text = "Please enter a Search Term"
                return
            }
            descriptionTitleLabel.text = "Please enter at least 3 characters"
        }
    }
    let activityView33 : UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(frame: .zero)
        return view
    }()
    let descriptionTitleLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        return label
    }()
    
    //MARK:SetupFunctions
    override func setupView() {
        super.setupView()
        setupAddView()
        setupAddConstraint()
        setupStyleView()
    }
    override func setupAddView() {
        super.setupAddView()
        addSubview(descriptionTitleLabel)
    }
    override func setupAddConstraint() {
        super.setupAddConstraint()
        descriptionTitleLabel.anchorCenterSuperview()
    }
    override func setupStyleView() {
        super.setupStyleView()
        
    }
}
