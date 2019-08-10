//
//  BaseView.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 9.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation
import UIKit

class BaseView: UIView {
    
    let activityView : UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(frame: .zero)
        view.color = .black
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:Loading
    func showHUD(){
        guard let window = UIApplication.shared.keyWindow else { return }
        activityView.frame = window.frame
        window.addSubview(activityView)
    }
    func hideHUD(){
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveLinear, animations: {
            self.activityView.removeFromSuperview()
        })
    }
    //MARK:GestureRecognizer
    fileprivate func setupAddGestureRecognizer(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureRecognizer))
        tapGestureRecognizer.numberOfTapsRequired = 1
        tapGestureRecognizer.cancelsTouchesInView = false
        isUserInteractionEnabled = true
        addGestureRecognizer(tapGestureRecognizer)
    }
    @objc internal func handleTapGestureRecognizer(){
        self.endEditing(true)
    }
}
extension BaseView : SetupFunctions {
    
    //MARK:SetupFunctions
    internal func setupView() {
        setupAddGestureRecognizer()
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

