//
//  SetupFunctions.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 8.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//


import Foundation

@objc protocol SetupFunctions : NSObjectProtocol {
    
    @available(iOS 2.0, *)
    @objc optional func setupView()
    
    @available(iOS 2.0, *)
    @objc optional func setupAddView()
    
    @available(iOS 2.0, *)
    @objc optional func setupAddConstraint()
    
    @available(iOS 2.0, *)
    @objc optional func setupCollectionView()
    
    @available(iOS 2.0, *)
    @objc optional func setupTableView()
    
    @available(iOS 2.0, *)
    @objc optional func setupStyleView()
    
    @available(iOS 2.0, *)
    @objc optional func setupNavigationBar()
    
}

