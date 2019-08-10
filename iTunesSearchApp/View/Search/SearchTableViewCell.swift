//
//  SearchTableViewCell.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 9.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class SearchTableViewCell: BaseTableViewCell {
    
    static let cellId = "SearchTableViewCellId"
    
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
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.lightGray
        label.textAlignment = .left
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
    let descriptionTextLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    let kindTitleLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .purple
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
        addSubview(searchImageView)
        addSubview(collectionNameLabel)
        addSubview(artistNameLabel)
        addSubview(kindTitleLabel)
        addSubview(descriptionTextLabel)
    }
    override func setupAddConstraint() {
        super.setupAddConstraint()
      
        searchImageView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: nil, paddingTop: 10, paddingleft: 10, paddingBottom: 10, paddingRight: 0, width: 0, height: 0, centerX: nil, centerY: nil)
        searchImageView.widthAnchor.constraint(equalTo: searchImageView.heightAnchor, multiplier: 1).isActive = true
        
        kindTitleLabel.anchor(top: nil, leading: nil, bottom: searchImageView.bottomAnchor, trailing: self.trailingAnchor, paddingTop: 0, paddingleft: 0, paddingBottom: 10, paddingRight: 10, width: 0, height: 20, centerX: nil, centerY: nil)
        collectionNameLabel.anchor(top: searchImageView.topAnchor, leading: searchImageView.trailingAnchor, bottom: nil, trailing: trailingAnchor, paddingTop: 10, paddingleft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0, centerX: nil, centerY: nil)
        
        artistNameLabel.anchor(top: collectionNameLabel.bottomAnchor, leading: searchImageView.trailingAnchor, bottom: nil, trailing: trailingAnchor, paddingTop: 6, paddingleft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0, centerX: nil, centerY: nil)
         descriptionTextLabel.anchor(top: artistNameLabel.bottomAnchor, leading: searchImageView.trailingAnchor, bottom: nil, trailing: kindTitleLabel.leadingAnchor, paddingTop: 6, paddingleft: 10, paddingBottom: 0, paddingRight: 4, width: 0, height: 0, centerX: nil, centerY: nil)
        
    }
    override func setupStyleView() {
        super.setupStyleView()
        //...
    }
    fileprivate func setupOrganizeViewWithData(){
        guard let searchModel = self.searchModel else { return }
        collectionNameLabel.text = searchModel.collectionName
        artistNameLabel.text = searchModel.artistName
        descriptionTextLabel.text = searchModel.shortDescription
        kindTitleLabel.text = searchModel.kind?.uppercased()
        let url = URL(string: searchModel.imageUrl ?? "")
        searchImageView.sd_setImage(with: url)
    }
}
