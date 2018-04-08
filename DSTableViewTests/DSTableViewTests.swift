//
//  DSTableViewTests.swift
//  DSTableViewTests
//
//  Created by Danishuo on 09/04/2018.
//  Copyright © 2018 ettoday. All rights reserved.
//

import XCTest
@testable import DSTableView
@testable import SwiftyJSON
@testable import RxSwift

class DSTableViewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAPI() {
        let expectation = self.expectation(description: "VideoListRepository getVideoListData() TEST")
        
        _ = VideoListRepository
            .shared
            .getVideoListData()
            .subscribe(onNext: { (videoListModel) in
                let model = videoListModel
                print(model)
                XCTAssert(true)
            }, onError: { (error) in
                print(error.localizedDescription)
                XCTAssert(false)
            }, onCompleted: {
                expectation.fulfill()
            }, onDisposed: {
                print("onDisposed")
            })
        
        waitForExpectations(timeout: 10.0) { (error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
}
