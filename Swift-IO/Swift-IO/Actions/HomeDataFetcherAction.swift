//
//  DataFetcherAction.swift
//  TestArchi4
//
//  Created by mathieu lecoupeur on 24/06/2017.
//  Copyright © 2017 mathieu lecoupeur. All rights reserved.
//

import Foundation

class HomeDataFetcherAction: Action {
    
    static let HomeDataKey = "home_data_key"
    
    func process(callback:ActionCallback) {
        
        // Should call a web service
        let result = [HomeDataFetcherAction.HomeDataKey: [CityModel(city: "Paris", postalCode: "75000", country: "France"),
                                                          CityModel(city: "San Francisco", postalCode: "98997", country: "United States"),
                                                          CityModel(city: "Milan", postalCode: "39833", country: "Italy"),
                                                          CityModel(city: "New York", postalCode: "04209", country: "United States"),
                                                          CityModel(city: "Sydney", postalCode: "095038", country: "Australia")]]
        
        callback(result, nil)
    }
    
    func cancel() {
    }
}
