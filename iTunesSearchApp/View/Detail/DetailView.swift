//
//  DetailView.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 10.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation
import UIKit

class DetailView: BaseView {
    
    var searchModel : SearchModel?{
        didSet{
            setupOrganizeViewWithData()
        }
    }
    
    let searchImageView : UIImageView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = .whiteSmoke
        return view
    }()
    let artistNameLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    let collectionNameLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    let kindTitleLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .purple
        label.textAlignment = .right
        return label
    }()
    let shortDescriptionLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    let countryTitleLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .purple
        label.textAlignment = .left
        return label
    }()
    
    //MARK:SetupFunctions
    override func setupView() {
        super.setupView()
        setupAddView()
        setupAddConstraint()
    }
    override func setupAddView() {
        super.setupAddView()
        addSubview(searchImageView)
        addSubview(artistNameLabel)
        addSubview(collectionNameLabel)
        addSubview(kindTitleLabel)
        addSubview(shortDescriptionLabel)
        addSubview(countryTitleLabel)
    }
    override func setupAddConstraint() {
        super.setupAddConstraint()
        
        let padding : CGFloat = 20
        
        searchImageView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: nil, paddingTop: padding, paddingleft: 0, paddingBottom: 0, paddingRight: 0, width: 160, height: 160, centerX: centerXAnchor, centerY: nil)
        artistNameLabel.anchor(top:searchImageView.bottomAnchor , leading: safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: safeAreaLayoutGuide.trailingAnchor, paddingTop: padding, paddingleft:0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, centerX: nil , centerY: nil)
        collectionNameLabel.anchor(top:artistNameLabel.bottomAnchor , leading: safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: safeAreaLayoutGuide.trailingAnchor, paddingTop: padding, paddingleft:padding, paddingBottom: 0, paddingRight: padding, width: 0, height: 0, centerX: nil , centerY: nil)
        shortDescriptionLabel.anchor(top:collectionNameLabel.bottomAnchor , leading: safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: safeAreaLayoutGuide.trailingAnchor, paddingTop: padding, paddingleft:padding, paddingBottom: 0, paddingRight: padding, width: 0, height: 0, centerX: nil , centerY: nil)
        kindTitleLabel.anchor(top:shortDescriptionLabel.bottomAnchor , leading: nil, bottom: nil, trailing: safeAreaLayoutGuide.trailingAnchor, paddingTop: padding, paddingleft:padding, paddingBottom: 0, paddingRight: padding, width: 0, height: 0, centerX: nil , centerY: nil)
        countryTitleLabel.anchor(top:shortDescriptionLabel.bottomAnchor , leading: safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, paddingTop: padding, paddingleft:padding, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, centerX: nil , centerY: nil)
    }
    fileprivate func setupOrganizeViewWithData(){
        guard let searchModel = self.searchModel else { return }
        
        collectionNameLabel.text = searchModel.collectionName
        artistNameLabel.text = searchModel.artistName?.uppercased()
        shortDescriptionLabel.text = searchModel.shortDescription
        kindTitleLabel.text = searchModel.kind?.uppercased()
        countryTitleLabel.text = searchModel.country?.uppercased()
        let url = URL(string: searchModel.imageUrl ?? "")
        searchImageView.sd_setImage(with: url)

    }
}
