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
    
    let detailView : DetailView = {
       let view = DetailView(frame: .zero)
       return view
    }()
    
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
        
        self.detailViewModel = detailVM
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        detailView.searchModel = detailViewModel.getSearchModel()
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
        title = detailViewModel.getTitleNavigationBar()
    }
    override func setupAddView() {
        super.setupAddView()
        view.addSubview(detailView)
    }
    override func setupAddConstraint() {
        super.setupAddConstraint()
        detailView.fillSuperView()
    }
}
