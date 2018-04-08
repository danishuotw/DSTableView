//
//  VideoListCell.swift
//  DSTableView
//
//  Created by Danishuo on 08/04/2018.
//  Copyright © 2018 ettoday. All rights reserved.
//

import UIKit

class VideoListCell: UITableViewCell {
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(model: VideoModel) {
        self.videoImage.setWith(strUrl: model.img)
        self.videoTitle.text = model.title
    }
}
