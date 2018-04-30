//
//  SettingViewControllerTests.swift
//  DSTableViewTests
//
//  Created by Danishuo on 11/04/2018.
//  Copyright © 2018 ettoday. All rights reserved.
//

import XCTest
import Quick
import Nimble

@testable import DSTableView

class SettingViewControllerTests: QuickSpec {
    override func spec() {
        var subject: SettingViewController!
        beforeEach {
            subject =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
            subject.viewModel.items.append(UserItem())
            _ = subject.view
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
        
        it("numberOfRows should have 5 item") {
            XCTAssertEqual(subject.tableView.numberOfRows(inSection: 0), 5)
        }
        
        it("test cellForRow cell got dequeued") {
            let mockTableView = MockTableView()
            let sut = SettingViewController()
            mockTableView.dataSource = sut
            sut.viewModel.items.append(UserItem())
            mockTableView.register(MockVideoListCell.self, forCellReuseIdentifier: "SettingSwitchCell")
            mockTableView.reloadData()
            
            _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockVideoListCell
            expect(mockTableView.cellGotDequeued) == true
        }
        
        it("test cellForRow configCell got called") {
            let mockTableView = MockTableView()
            let sut = SettingViewController()
            mockTableView.dataSource = sut
            sut.viewModel.items.append(UserItem())
            mockTableView.register(MockVideoListCell.self, forCellReuseIdentifier: "SettingSwitchCell")
            mockTableView.reloadData()
            
            let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockVideoListCell
            expect(cell.setCellGotCalled) == true
        }
    }
}


class SettingModelTests: QuickSpec {
    override func spec() {
        let userItem = UserItem()
        describe("Test Setting Model for SettingProtocol") {
            context("when get UserItem property") {
                it("type should be euqul .user ") {
                    expect(userItem.type) == SettingItemType.user
                }
                it("sectionTitle should be equal .user ") {
                    expect(userItem.sectionTitle) == ""
                }
                it("type should be equal 5") {
                    expect(userItem.rowCount) == 5
                }
            }
        }
    }
}

// MARK: Mock
extension SettingViewControllerTests {
    class MockTableView: UITableView {
        var cellGotDequeued = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellGotDequeued = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MockVideoListCell: SettingSwitchCell {
        var setCellGotCalled = false
        
        override func set(title: String, isOn: Bool, change: ((Bool)->Void)?) {
            setCellGotCalled = true
        }
    }
}
