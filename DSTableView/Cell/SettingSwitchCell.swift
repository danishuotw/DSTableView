//
//  SettingSwitchCell.swift
//  DSTableView
//
//  Created by Danishuo on 07/04/2018.
//  Copyright © 2018 ettoday. All rights reserved.
//

import UIKit

class SettingSwitchCell: UITableViewCell {
    @IBOutlet weak var sw: UISwitch!
    @IBOutlet weak var labTitle: UILabel!
    
    var changeBlock: ((Bool) -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.contentView.underLine(show: true)
        sw.addTarget(self, action: #selector(switchValueChange), for: .valueChanged)
    }
    
    func set(title: String, isOn: Bool, change: ((Bool)->Void)?) {
        self.labTitle.text = title
        self.sw.isOn = isOn
        self.changeBlock = change
    }
    
    @objc func switchValueChange() {
        self.changeBlock?(sw.isOn)
    }
}
