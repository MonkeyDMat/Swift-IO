//
//  CitySortActionTests.swift
//  TestArchi4
//
//  Created by mathieu lecoupeur on 24/06/2017.
//  Copyright © 2017 mathieu lecoupeur. All rights reserved.
//

import XCTest
@testable import TestArchi4

class CitySortActionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testProcess() {
        
        let cities = [CityModel(city: "Paris", postalCode: "75000", country: "France"),
                      CityModel(city: "San Francisco", postalCode: "98997", country: "United States"),
                      CityModel(city: "Milan", postalCode: "39833", country: "Italy"),
                      CityModel(city: "New York", postalCode: "04209", country: "United States"),
                      CityModel(city: "Sydney", postalCode: "095038", country: "Australia")]
        
        let citiesASC = [CityModel(city: "Milan", postalCode: "39833", country: "Italy"),
                         CityModel(city: "New York", postalCode: "04209", country: "United States"),
                         CityModel(city: "Paris", postalCode: "75000", country: "France"),
                         CityModel(city: "San Francisco", postalCode: "98997", country: "United States"),
                         CityModel(city: "Sydney", postalCode: "095038", country: "Australia")]
        
        let citiesDESC = [CityModel(city: "Sydney", postalCode: "095038", country: "Australia"),
                          CityModel(city: "San Francisco", postalCode: "98997", country: "United States"),
                          CityModel(city: "Paris", postalCode: "75000", country: "France"),
                          CityModel(city: "New York", postalCode: "04209", country: "United States"),
                          CityModel(city: "Milan", postalCode: "39833", country: "Italy")]
        
        let action = CitySortAction()
        action.setup(cities: cities, sortOrder: .asc).process { (result, error) in
            
            let sortedCitiesAsc = result[CitySortAction.SortedDataKey] as? [CityModel]
            
            XCTAssertNotNil(sortedCitiesAsc)
            
            for (index, city) in sortedCitiesAsc!.enumerated() {
                
                XCTAssertEqual(city.city, citiesASC[index].city)
                XCTAssertEqual(city.postalCode, citiesASC[index].postalCode)
                XCTAssertEqual(city.country, citiesASC[index].country)
            }
        }
        
        action.setup(cities: cities, sortOrder: .desc).process { (result, error) in
            
            let sortedCitiesDesc = result[CitySortAction.SortedDataKey] as? [CityModel]
            
            XCTAssertNotNil(sortedCitiesDesc)
            
            for (index, city) in sortedCitiesDesc!.enumerated() {
                
                XCTAssertEqual(city.city, citiesDESC[index].city)
                XCTAssertEqual(city.postalCode, citiesDESC[index].postalCode)
                XCTAssertEqual(city.country, citiesDESC[index].country)
            }
        }
    }
}
