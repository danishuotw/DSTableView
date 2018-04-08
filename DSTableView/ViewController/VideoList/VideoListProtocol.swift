//
//  VideoListProtocol.swift
//  DSTableView
//
//  Created by Danishuo on 09/04/2018.
//  Copyright © 2018 ettoday. All rights reserved.
//

import Foundation

protocol VideoListViewProtocol: class {
    func updateUI()
}

protocol VideoListViewModelProtocol {
    func fetchData()
}
