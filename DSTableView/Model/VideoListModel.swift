//
//  VideoListModel.swift
//  DSTableView
//
//  Created by Danishuo on 09/04/2018.
//  Copyright © 2018 ettoday. All rights reserved.
//

import Foundation
import SwiftyJSON

class VideoListModel: NSObject {
    var videos = [VideoModel]()
    
    convenience init(json: JSON) {
        self.init()
        self.configureWithJSON(json)
    }
    
    func configureWithJSON(_ json: JSON) {
        for subjson in json["videos"].arrayValue {
            videos.append(VideoModel(json: subjson))
        }
    }
}

class VideoModel {
    var title: String?
    var img: String?
    
    convenience init(json: JSON) {
        self.init()
        self.configureWithJSON(json)
    }
    
    func configureWithJSON(_ json: JSON) {
        self.title = json["title"].stringValue
        self.img = json["img"].stringValue
    }
}
