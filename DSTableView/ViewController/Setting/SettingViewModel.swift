//
//  SettingViewModel.swift
//  DSTableView
//
//  Created by Danishuo on 09/04/2018.
//  Copyright © 2018 ettoday. All rights reserved.
//

import Foundation

class SettingViewModel {
    weak var delegate: SettingViewProtocol?
    var items = [SettingItemProtocol]()
    
    init(delegate: SettingViewProtocol) {
        self.delegate = delegate
        self.setupItem()
    }
    
    private func setupItem() {
        items.removeAll()
        let user = UserItem()
        items.append(user)
    }
}

extension SettingViewModel: SettingViewModelProtocol {

}
