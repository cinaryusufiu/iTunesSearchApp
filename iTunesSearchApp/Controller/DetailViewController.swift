//
//  DetailViewController.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 10.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: BaseViewController {
    
    
    var detailViewModel : DetailViewModel!
    
    init(detailViewModel : DetailViewModel?) {
        super.init(nibName: nil, bundle: nil)
        
    }
    convenience init(detailViewModel: DetailViewModel) {
        self.init(detailViewModel: nil)
        setupInitilaze(detailViewModel: detailViewModel)
    }
    convenience init() {
        self.init(detailViewModel: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    fileprivate func setupInitilaze(detailViewModel : DetailViewModel?){
        guard let detailVM = detailViewModel else { return  }
        detailVM.delegate = self
        self.detailViewModel = detailVM
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    //MARK:SetupFunctions
    override func setupView() {
        super.setupView()
        setupNavigationBar()
        setupAddView()
        setupAddConstraint()
    }
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
    }
    override func setupAddView() {
        super.setupAddView()
        
    }
    override func setupAddConstraint() {
        super.setupAddConstraint()
        
    }
}
extension DetailViewController : DetailViewModelDelegate{
   
    //MARK:DetailViewModelDelegate
    func reloadView() {
        
    }
}
