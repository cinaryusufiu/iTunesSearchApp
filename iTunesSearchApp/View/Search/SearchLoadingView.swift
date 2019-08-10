//
//  SearchLoadingView.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 9.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation
import UIKit

class SearchLoadingView: BaseView {
    
    let descriptionTitleLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.text = "Please waitings"
        return label
    }()
    
    //MARK:SetupFunctions
    override func setupView() {
        super.setupView()
        setupAddView()
        setupAddConstraint()
        setupStyleView()
        activityView.startAnimating()
    }
    override func setupAddView() {
        super.setupAddView()
        addSubview(activityView)
        addSubview(descriptionTitleLabel)
    }
    override func setupAddConstraint() {
        super.setupAddConstraint()
        activityView.anchorCenterSuperview()
        descriptionTitleLabel.anchor(top: activityView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, paddingTop: 20, paddingleft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, centerX: centerXAnchor, centerY: nil)
    }
    override func setupStyleView() {
        super.setupStyleView()
        
    }
}
