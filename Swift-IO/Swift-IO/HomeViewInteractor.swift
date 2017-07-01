//
//  HomeViewInteractor.swift
//  TestArchi4
//
//  Created by mathieu lecoupeur on 22/06/2017.
//  Copyright © 2017 mathieu lecoupeur. All rights reserved.
//

import Foundation
import UIKit

@objc protocol HomeViewInteractorDelegate: class {
    func onDataUpdated()
}

class HomeViewInteractor: NSObject {
    
    var model: HomeModel!
    
    weak var delegate: HomeViewInteractorDelegate?
    
    // Actions
    private var homeDataFetcherAction: HomeDataFetcherAction? = HomeDataFetcherAction()
    private var citySortAction: CitySortAction? = CitySortAction()
    
    func setup(homeDataFetcherAction:HomeDataFetcherAction,
               citySortAction:CitySortAction) {
        
        self.homeDataFetcherAction = homeDataFetcherAction
        self.citySortAction = citySortAction
    }
    
    //MARK: - IBActions
    @IBAction func onFetch() {
        
        homeDataFetcherAction?.process(callback: { (result, error) in
            
            model.data = result[HomeDataFetcherAction.HomeDataKey] as? [CityModel]
            
            delegate?.onDataUpdated()
        })
    }
    
    @IBAction func onSortASC() {
        
        citySortAction?.setup(cities: model.data, sortOrder: .asc).process(callback: { (result, error) in
            
            model.data = result[CitySortAction.SortedDataKey] as? [CityModel]
            
            delegate?.onDataUpdated()
        })
    }
    
    @IBAction func onSortDESC() {
        
        citySortAction?.setup(cities: model.data, sortOrder: .desc).process(callback: { (result, error) in
            
            model.data = result[CitySortAction.SortedDataKey] as? [CityModel]
            
            delegate?.onDataUpdated()
        })
    }
}

/*extension HomeViewInteractor: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("\(String(describing: model.data?[indexPath.row].city))")
    }
}*/
