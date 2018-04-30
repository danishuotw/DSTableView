//
//  VideoListCell.swift
//  DSTableView
//
//  Created by Danishuo on 10/04/2018.
//  Copyright © 2018 ettoday. All rights reserved.
//

import UIKit

class VideoListCell: UITableViewCell {
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoImageView: UIImageView!
    
    var model: VideoModel?
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        self.videoImage.image = #imageLiteral(resourceName: "loading")
//        self.videoTitle.text = ""
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(model: VideoModel) {
        self.model = model
        self.videoImageView.setWith(strUrl: model.img)
        self.videoTitle.text = model.title
    }
    
    func updateReadStatus() {
        if let model = model {
            configureCell(model: model)
        }
    }
}
