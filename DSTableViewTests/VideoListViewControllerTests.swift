//
//  VideoListViewControllerTests.swift
//  DSTableViewTests
//
//  Created by Danishuo on 11/04/2018.
//  Copyright © 2018 ettoday. All rights reserved.
//

import XCTest
import Quick
import Nimble
import UIKit

@testable import DSTableView
@testable import SwiftyJSON
@testable import RxSwift

class VideoListViewControllerTests: QuickSpec {
    override func spec() {
        var subject: VideoListViewController!
        beforeEach {
            subject =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VideoListViewController") as! VideoListViewController
            _ = subject.view
            subject.viewModel.videoList = self.getStubListData(fileName: "videoList")
            subject.tableView.dataSource = subject
            subject.tableView.reloadData()
        }
        
        it("test viewModel is not nil") {
            XCTAssertNotNil(subject.viewModel.delegate)
        }

        it("test TableView IsNotNilAfterViewDidLoad") {
            XCTAssertNotNil(subject.tableView)
        }

        it("numberOfSections should have 1") {
             XCTAssertEqual(subject.tableView.numberOfSections, 1)
        }
        
        it("numberOfRows should have 3 video") {
            XCTAssertEqual(subject.tableView.numberOfRows(inSection: 0), 3)
        }
        
        it("test cellForRow cell got dequeued") {
            let mockTableView = MockTableView()
            let sut = VideoListViewController()
            mockTableView.dataSource = sut
            sut.viewModel.videoList = self.getStubListData(fileName: "videoList")
            mockTableView.register(MockVideoListCell.self, forCellReuseIdentifier: "VideoListCell")
            mockTableView.reloadData()

            _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockVideoListCell
            expect(mockTableView.cellGotDequeued) == true
        }

        it("test cellForRow configCell got called") {
            let mockTableView = MockTableView()
            let sut = VideoListViewController()
            mockTableView.dataSource = sut
            sut.viewModel.videoList = self.getStubListData(fileName: "videoList")
            mockTableView.register(MockVideoListCell.self, forCellReuseIdentifier: "VideoListCell")
            mockTableView.reloadData()

            let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockVideoListCell
            expect(cell.configCellGotCalled) == true
        }
    }
}

class VideoListModelTests: QuickSpec {
    override func spec() {
        var model: VideoListModel!
        describe("test VideoListModel") {
            beforeEach {
                guard let filePath = Bundle.main.path(forResource: "videoList", ofType: "json") else { return }
                let fileUrl = URL(fileURLWithPath: filePath)
                guard let data = try? Data(contentsOf: fileUrl) else { return }
                guard let json = try? JSON(data: data) else { return }
                model = VideoListModel(json: json)
            }
            context("when inject test json") {
                it("first video should be equal IGN News.......", closure: {
                    expect( model.videos[0].title) == "IGN News - Kiefer Sutherland Playing Snake in Metal Gear Solid V"
                })
                it("first video should be equal IGN http://img.youtube.com/vi/S-FFgpUfVX8/maxresdefault.jpg", closure: {
                    expect( model.videos[0].img) == "http://img.youtube.com/vi/S-FFgpUfVX8/maxresdefault.jpg"
                })
            }
        }
    }
}

// MARK: Private
extension VideoListViewControllerTests {
    private func getStubListData<T: NSObject>(fileName: String) -> T {
        guard let bundlePath = Bundle.main.path(forResource: fileName, ofType: "json") else {
            return T()
        }
        let url = URL(fileURLWithPath: bundlePath)
        if let data = try? Data(contentsOf: url) {
            if let json = try? JSON(data: data) {
                switch T.self {
                case is VideoListModel.Type:
                    return VideoListModel(json: json) as! T
                default:
                    break
                }
            }
        }
        return T()
    }
}

// MARK: Mock
extension VideoListViewControllerTests {
    class MockTableView: UITableView {
        var cellGotDequeued = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellGotDequeued = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MockVideoListCell: VideoListCell {
        var configCellGotCalled = false
        
        override func configureCell(model: VideoModel) {
            configCellGotCalled = true
        }
    }
}
