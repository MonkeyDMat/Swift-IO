//
//  HomeViewModelTests.swift
//  TestArchi4
//
//  Created by mathieu lecoupeur on 24/06/2017.
//  Copyright © 2017 mathieu lecoupeur. All rights reserved.
//

import XCTest
@testable import TestArchi4

class HomeViewModelTests: XCTestCase {
    
    private var controller: HomeViewController!
    private var viewModel: HomeViewModel! 
    
    override func setUp() {
        
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        controller = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        _ = controller?.view
        controller?.viewDidLoad()
        
        viewModel = controller.viewModel
    }
    
    override func tearDown() {
        
        controller = nil
        
        super.tearDown()
    }
    
    func testOutlets() {
        
        XCTAssertNotNil(viewModel.tableView)
    }
    
    func testRefreshList() {
        
        XCTAssertEqual(viewModel.tableView?.numberOfRows(inSection: 0), 0)
        
        viewModel.model.data = [CityModel(city: "Paris", postalCode: "75000", country: "France"),
                                CityModel(city: "San Francisco", postalCode: "98997", country: "United States"),
                                CityModel(city: "Milan", postalCode: "39833", country: "Italy"),
                                CityModel(city: "New York", postalCode: "04209", country: "United States"),
                                CityModel(city: "Sydney", postalCode: "095038", country: "Australia")]

        viewModel.refreshList()
        
        XCTAssertEqual(viewModel.tableView?.numberOfRows(inSection: 0), 5)
    }
    
    func testNumRows() {
        
        var numRows = viewModel.tableView(viewModel.tableView!, numberOfRowsInSection: 0)
        
        XCTAssertEqual(numRows, 0)
        
        viewModel.model.data = [CityModel(city: "Paris", postalCode: "75000", country: "France"),
                                CityModel(city: "San Francisco", postalCode: "98997", country: "United States"),
                                CityModel(city: "Milan", postalCode: "39833", country: "Italy"),
                                CityModel(city: "New York", postalCode: "04209", country: "United States"),
                                CityModel(city: "Sydney", postalCode: "095038", country: "Australia")]
        
        numRows = viewModel.tableView(viewModel.tableView!, numberOfRowsInSection: 0)
        
        XCTAssertEqual(numRows, 5)
    }
    
    func testCellForRow() {
        
        let data = [CityModel(city: "Paris", postalCode: "75000", country: "France"),
                    CityModel(city: "San Francisco", postalCode: "98997", country: "United States"),
                    CityModel(city: "Milan", postalCode: "39833", country: "Italy"),
                    CityModel(city: "New York", postalCode: "04209", country: "United States"),
                    CityModel(city: "Sydney", postalCode: "095038", country: "Australia")]
        
        viewModel.model.data = data
        
        for i in 0..<viewModel.model.data!.count {
            
            let cell = viewModel.tableView(viewModel.tableView!, cellForRowAt: IndexPath(row: i, section: 0))
            
            XCTAssertEqual(cell.textLabel?.text, "\(data[i].city) - \(data[i].postalCode) - \(data[i].country)")
        }
    }
}
