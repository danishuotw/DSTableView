//
//  MemberRepositoryTests.swift
//  DSTableViewTests
//
//  Created by Danishuo on 11/04/2018.
//  Copyright © 2018 ettoday. All rights reserved.
//

import XCTest
import Quick
import Nimble

@testable import DSTableView

class MemberRepositoryTests: QuickSpec {
    override func spec() {
        describe("Test MemberRepository shared property") {
            context("when set true") {
                it("isAutoPlay should return true", closure: {
                    MemberRepository.shared.isAutoPlay = true
                    expect(MemberRepository.shared.isAutoPlay) == true
                })
                it("isSubtitleSync should return true", closure: {
                    MemberRepository.shared.isSubtitleSync = true
                    expect(MemberRepository.shared.isSubtitleSync) == true
                })
                it("isSearchingWord should return true", closure: {
                    MemberRepository.shared.isSearchingWord = true
                    expect(MemberRepository.shared.isSearchingWord) == true
                })
                it("isRecommendedVideoReminder should return true", closure: {
                    MemberRepository.shared.isRecommendedVideoReminder = true
                    expect(MemberRepository.shared.isRecommendedVideoReminder) == true
                })
                it("isLearningNotification should return true", closure: {
                    MemberRepository.shared.isLearningNotification = true
                    expect(MemberRepository.shared.isLearningNotification) == true
                })
            }
        }
    }
}
