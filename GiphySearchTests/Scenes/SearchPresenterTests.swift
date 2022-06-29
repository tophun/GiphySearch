//
//  SearchPresenterTests.swift
//  GiphySearch
//
//  Created by Collie on 2022/06/29.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import GiphySearch
import XCTest

class SearchPresenterTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: SearchPresenter!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupSearchPresenter()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupSearchPresenter() {
        sut = SearchPresenter()
    }
    
    // MARK: Test doubles
    
    class SearchDisplayLogicSpy: SearchDisplayLogic {
        
    }
    
    // MARK: Tests
    
    func testPresentSomething() {
        // Given
        let spy = SearchDisplayLogicSpy()
        sut.viewController = spy
        //let response = Search.Something.Response()
        
        // When
        //sut.presentSomething(response: response)
        
        // Then
        //XCTAssertTrue(spy.displaySomethingCalled, "presentSomething(response:) should ask the view controller to display the result")
    }
}