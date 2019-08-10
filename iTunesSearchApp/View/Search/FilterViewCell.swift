//
//  FilterViewCell.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 9.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation
import UIKit


class FilterViewCell: BaseCollectionViewCell {
    
    static let cellId = "FilterViewCellId"
    
    let titleTextLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(red:94/255.0, green:97/255.0, blue:100/255.0,  alpha:1)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    let seperatorView : UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    override var isSelected: Bool {
        didSet{
            if isSelected {
                return setupSelectedStyle()
            }
            setupUnSelectedStyle()
        }
    }
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                return setupSelectedStyle()
            }
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
        addSubview(titleTextLabel)
        addSubview(seperatorView)
    }
    override func setupAddConstraint() {
        super.setupAddConstraint()
        titleTextLabel.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, paddingTop: 0, paddingleft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0, centerX: nil, centerY: centerYAnchor)
        
        seperatorView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 0, paddingleft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5, centerX: nil, centerY: nil)
    }
    override func setupStyleView() {
        super.setupStyleView()
        
    }
    fileprivate func setupSelectedStyle(){
        titleTextLabel.textColor = .white
        self.backgroundColor = UIColor(red:0/255.0, green:71/255.0, blue:204/255.0,  alpha:1)
        seperatorView.alpha = 0
    }
    fileprivate func setupUnSelectedStyle(){
        titleTextLabel.textColor = UIColor(red:94/255.0, green:97/255.0, blue:100/255.0,  alpha:1)
        self.backgroundColor = .white
        seperatorView.alpha = 1
    }
}
