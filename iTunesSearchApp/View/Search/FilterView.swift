//
//  FilterView.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 9.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation
import UIKit

protocol FilterViewDataSource : NSObjectProtocol {
    func getAllMediaType() -> [MediaType]?
    func selectedMediaType() -> Int
}
protocol FilterViewDelegate : NSObjectProtocol {
    func onClickedCellWith(index : Int)
}
class FilterView: BaseView {
    
    weak var dataSource : FilterViewDataSource?{
        didSet{
            setSelectedMediaType()
        }
    }
    weak var delegate : FilterViewDelegate?
    
    private lazy var collectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    //MARK:SetupFunctions
    override func setupView() {
        super.setupView()
        self.backgroundColor = .white
        setupAddView()
        setupAddConstraint()
        setupStyleView()
        setupCollectionView()
    }
    override func setupAddView() {
        super.setupAddView()
        addSubview(collectionView)
    }
    override func setupAddConstraint() {
        super.setupAddConstraint()
        collectionView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 10, paddingleft: 10, paddingBottom: 10, paddingRight: 10, width: 0, height: 0, centerX: nil, centerY: nil)
    }
    override func setupCollectionView() {
        super.setupCollectionView()
        collectionView.register(FilterViewCell.self, forCellWithReuseIdentifier:FilterViewCell.cellId)
    }
    override func setupStyleView() {
        super.setupStyleView()
        self.layer.cornerRadius = 10
    }
    fileprivate func setSelectedMediaType(){
        guard let dataSource = self.dataSource else { return  }
        if (dataSource.getAllMediaType()?.count) ?? 0 > dataSource.selectedMediaType(){
            let index = dataSource.selectedMediaType()
            collectionView.selectItem(at:IndexPath(item: index, section: 0), animated: true, scrollPosition: .top)
        }
    }
    //MARK:OutSide-func
    func reloadTableView(){
        collectionView.reloadData()
        setSelectedMediaType()
    }
}
extension FilterView : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    //MARK:UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.getAllMediaType()?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier:FilterViewCell.cellId, for: indexPath) as! FilterViewCell
        cell.titleTextLabel.text = (dataSource?.getAllMediaType()?[indexPath.row]).map { $0.rawValue }
        return cell
    }
    
    //MARK:UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: 44)
    }
    
    //MARK:UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let delegate = self.delegate else { return }
        delegate.onClickedCellWith(index: indexPath.row)
    }
}
