//
//  SettingModel.swift
//  DSTableView
//
//  Created by Danishuo on 10/04/2018.
//  Copyright © 2018 ettoday. All rights reserved.
//

import Foundation

public enum SettingItemType {
    case user
    // case ...
}

public enum SettingCellType {
    public enum user {
        case autoPlay
        case subtitleSync
        case searchingWord
        case recommendedVideoReminder
        case learningNotification
    }
}

protocol SettingItemProtocol {
    var type: SettingItemType { get }
    var sectionTitle: String { get }
    var rowCount: Int { get }
}

struct UserItem: SettingItemProtocol {
    var type: SettingItemType {
        return .user
    }
    
    var sectionTitle: String {
        return ""
    }
    
    var rowCount: Int {
        return self.cellTypes.count
    }
    
    var cellTypes = [SettingCellType.user.autoPlay,
                     SettingCellType.user.subtitleSync,
                     SettingCellType.user.searchingWord,
                     SettingCellType.user.recommendedVideoReminder,
                     SettingCellType.user.learningNotification]
}
