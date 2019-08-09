//
//  BaseViewController.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 9.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
  
}
extension BaseViewController : SetupFunctions {
    
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
    internal func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = UIColor.whiteSmoke
        definesPresentationContext = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black ,  NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}
