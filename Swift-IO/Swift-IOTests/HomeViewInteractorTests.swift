//
//  HomeViewInteractorTests.swift
//  TestArchi4
//
//  Created by mathieu lecoupeur on 24/06/2017.
//  Copyright © 2017 mathieu lecoupeur. All rights reserved.
//

import XCTest
@testable import TestArchi4

class HomeViewInteractorTests: XCTestCase {
    
    private var interactor: HomeViewInteractor! 
    
    fileprivate var fetchExpectation: XCTestExpectation?
    fileprivate var sortExpectation: XCTestExpectation?
    
    override func setUp() {
        
        super.setUp()
        
        let model = HomeModel()
        
        interactor = HomeViewInteractor()
        interactor.model = model
        interactor.delegate = self
        interactor.setup(homeDataFetcherAction: HomeDataFetcherAction(), citySortAction: CitySortAction())
    }
    
    override func tearDown() {
        
        interactor.delegate = nil
        interactor.model = nil
        interactor = nil
        
        super.tearDown()
    }
    
    func testInteractorFetch() {
        
        fetchExpectation = XCTestExpectation()
        interactor.onFetch()
        wait(for: [fetchExpectation!], timeout: 5.0)
        
        XCTAssertNotNil(interactor.model.data)
    }
    
    func testInteractorSortAsc() {
        
        sortExpectation = XCTestExpectation()
        interactor.onSortASC()
        wait(for: [sortExpectation!], timeout: 5.0)
    }
    
    func testInteractorDesc() {
        
        sortExpectation = XCTestExpectation()
        interactor.onSortDESC()
        wait(for: [sortExpectation!], timeout: 5.0)
    }
}

extension HomeViewInteractorTests: HomeViewInteractorDelegate {
    
    //MARK: - HomeViewInteractor
    func onDataUpdated() {
        fetchExpectation?.fulfill()
        sortExpectation?.fulfill()
    }
}
