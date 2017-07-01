//
//  HomeViewControllerTests.swift
//  TestArchi4
//
//  Created by mathieu lecoupeur on 24/06/2017.
//  Copyright © 2017 mathieu lecoupeur. All rights reserved.
//

import XCTest
@testable import TestArchi4

class HomeViewControllerTests: XCTestCase {
    
    private var controller: HomeViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        controller = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        _ = controller?.view
        controller?.viewDidLoad()
    }
    
    override func tearDown() {
        
        controller = nil
        
        super.tearDown()
    }
    
    func testOnDataUpdated() {
        
        XCTAssertEqual(controller.viewModel.tableView?.numberOfRows(inSection: 0), 0)
        
        controller.viewModel.model.data = [CityModel(city: "Paris", postalCode: "75000", country: "France"),
                                            CityModel(city: "San Francisco", postalCode: "98997", country: "United States"),
                                            CityModel(city: "Milan", postalCode: "39833", country: "Italy"),
                                            CityModel(city: "New York", postalCode: "04209", country: "United States"),
                                            CityModel(city: "Sydney", postalCode: "095038", country: "Australia")]
        
        controller.onDataUpdated()
        
        XCTAssertEqual(controller.viewModel.tableView?.numberOfRows(inSection: 0), 5)
    }
    
    func testStatusBarHidden() {
        
        XCTAssertEqual(controller.prefersStatusBarHidden, true)
    }
}
