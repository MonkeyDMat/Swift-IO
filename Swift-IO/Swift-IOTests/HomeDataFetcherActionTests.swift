//
//  HomeDataFetcherActionTests.swift
//  TestArchi4
//
//  Created by mathieu lecoupeur on 24/06/2017.
//  Copyright © 2017 mathieu lecoupeur. All rights reserved.
//

import XCTest
@testable import TestArchi4

class HomeDataFetcherActionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testProcess() {
        
        let action = HomeDataFetcherAction()
        action.process { (results, error) in
            
            let cities = results[HomeDataFetcherAction.HomeDataKey] as? [CityModel]
            
            let expectedCities = [CityModel(city: "Paris", postalCode: "75000", country: "France"),
                                  CityModel(city: "San Francisco", postalCode: "98997", country: "United States"),
                                  CityModel(city: "Milan", postalCode: "39833", country: "Italy"),
                                  CityModel(city: "New York", postalCode: "04209", country: "United States"),
                                  CityModel(city: "Sydney", postalCode: "095038", country: "Australia")]
            
            XCTAssertNotNil(cities)
            for (index, city) in cities!.enumerated() {
                
                XCTAssertEqual(city.city, expectedCities[index].city)
                XCTAssertEqual(city.postalCode, expectedCities[index].postalCode)
                XCTAssertEqual(city.country, expectedCities[index].country)
            }
        }
    }
}
