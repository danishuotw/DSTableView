//
//  VideoListRepository.swift
//  DSTableView
//
//  Created by Danishuo on 10/04/2018.
//  Copyright © 2018 ettoday. All rights reserved.
//

import Foundation
import RxSwift
import SwiftyJSON

class VideoListRepository {
    
    static var shared = VideoListRepository()
    
    func getVideoListData() -> Observable<VideoListModel> {
//        let url = "https://api.voicetube.com/thirdparty/test.php"
//        let parameters = ["key" : "VoiceTube"]
//
//        return APIManager
//            .shared
//            .request(url: url, parameters: parameters)
//            .map { (json) -> VideoListModel in
//                return VideoListModel(json: json)
//            }
        
        guard let filePath = Bundle.main.path(forResource: "videoList", ofType: "json") else {
            return Observable.empty()
        }
        
        var mockModel = VideoListModel()
        let fileUrl = URL(fileURLWithPath: filePath)
        if let data = try? Data(contentsOf: fileUrl) {
            if let json = try? JSON(data: data) {
                mockModel = VideoListModel(json: json)
            }
        }
        return Observable.just(mockModel)
    }
}
