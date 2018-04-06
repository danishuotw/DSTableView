//
//  MemberRepository.swift
//  DSTableView
//
//  Created by Danishuo on 09/04/2018.
//  Copyright © 2018 ettoday. All rights reserved.
//

import Foundation

class MemberRepository {
    static let share = MemberRepository()
    
    var isAutoPlay: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: KEY_IS_AUTO_PLAY)
        }
        get {
            return UserDefaults.standard.bool(forKey: KEY_IS_AUTO_PLAY)
        }
    }
    
    var isSubtitleSync: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: KEY_IS_SUBTITLE_SYNC)
        }
        get {
            return UserDefaults.standard.bool(forKey: KEY_IS_SUBTITLE_SYNC)
        }
    }
    
    var isSearchingWord: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: KEY_IS_SEARCHING_WORD)
        }
        get {
            return UserDefaults.standard.bool(forKey: KEY_IS_SEARCHING_WORD)
        }
    }
    
    var isRecommendedVideoReminder: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: KEY_IS_RECOMMENDED_VIDEO_REMINDER)
        }
        get {
            return UserDefaults.standard.bool(forKey: KEY_IS_RECOMMENDED_VIDEO_REMINDER)
        }
    }
    
    var isLearningNotification: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: KEY_IS_LEARNING_NOTIFICATION)
        }
        get {
            return UserDefaults.standard.bool(forKey: KEY_IS_LEARNING_NOTIFICATION)
        }
    }
}
