//
//  UIImageView+ImageLoad.swift
//  DSTableView
//
//  Created by Danishuo on 08/04/2018.
//  Copyright © 2018 ettoday. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    func setWith(strUrl: String?) {
        if let str = strUrl {
            self.kf.setImage(with: URL(string: str))
        }
    }
}
