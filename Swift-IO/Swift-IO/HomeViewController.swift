//
//  HomeViewController.swift
//  TestArchi4
//
//  Created by mathieu lecoupeur on 22/06/2017.
//  Copyright © 2017 mathieu lecoupeur. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var viewModel: HomeViewModel!
    @IBOutlet var interactor: HomeViewInteractor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let model = HomeModel()
        
        viewModel.model = model
        interactor.model = model
        interactor.delegate = self
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension HomeViewController: HomeViewInteractorDelegate {
    
    func onDataUpdated() {
        
        viewModel.refreshList()
    }
}
