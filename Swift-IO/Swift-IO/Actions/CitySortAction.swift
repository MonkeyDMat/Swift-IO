//
//  SortDataAction.swift
//  TestArchi4
//
//  Created by mathieu lecoupeur on 24/06/2017.
//  Copyright © 2017 mathieu lecoupeur. All rights reserved.
//

import Foundation

enum SortOrder {
    case asc
    case desc
}

class CitySortAction: Action {
    
    static let SortedDataKey = "sorted_data_key"
    
    private var cities: [CityModel]?
    private var sortOrder: SortOrder! = .asc
    
    func setup(cities: [CityModel]?, sortOrder: SortOrder) -> CitySortAction {
        
        self.cities = cities
        self.sortOrder = sortOrder
        
        return self
    }
    
    func process(callback:ActionCallback) {
        
        let result = cities?.sorted(by: { (city1, city2) -> Bool in
            
            return (sortOrder == .asc) ? city1.city < city2.city : city1.city > city2.city
        })
        
        callback([CitySortAction.SortedDataKey: result ?? []], nil)
    }
    
    func cancel() {
    }
}
