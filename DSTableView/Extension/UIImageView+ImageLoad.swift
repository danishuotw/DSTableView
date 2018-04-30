//
//  UIImageView+ImageLoad.swift
//  DSTableView
//
//  Created by Danishuo on 10/04/2018.
//  Copyright © 2018 ettoday. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    func setWith(strUrl: String?) {
        if let str = strUrl {
            /// Member for animation transition when using UIImageView. Kingfisher will use the `ImageTransition` of
            /// this enum to animate the image in if it is downloaded from web. The transition will not happen when the
            /// image is retrieved from either memory or disk cache by default. If you need to do the transition even when
            /// the image being retrieved from cache, set `ForceTransition` as well.
            self.kf.setImage(with: URL(string: str), placeholder: #imageLiteral(resourceName: "loading"), options: [.transition(.fade(0.3))], progressBlock: nil, completionHandler: nil)
        }
    }
}
