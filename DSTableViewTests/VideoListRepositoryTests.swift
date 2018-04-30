//
//  VideoListRepositoryTests.swift
//  DSTableViewTests
//
//  Created by Danishuo on 12/04/2018.
//  Copyright © 2018 ettoday. All rights reserved.
//

import XCTest
import Quick
import Nimble

@testable import DSTableView
@testable import SwiftyJSON
@testable import RxSwift

class VideoListRepositoryTests: XCTestCase {
    func testGetVideoListData_whenRequestData_shouldBeReturnVideoListModel() {
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
        
        waitForExpectations(timeout: 30.0) { (error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
