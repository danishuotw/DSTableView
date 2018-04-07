//
//  SettingViewController.swift
//  DSTableView
//
//  Created by Danishuo on 09/04/2018.
//  Copyright © 2018 ettoday. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var viewModel: SettingViewModel = {
        return SettingViewModel(delegate: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
//        self.tableView.delegate = self
        self.tableView.dataSource = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("SettingViewController deinit")
    }
    
    private func setup() {
        self.tableView.register(UINib(nibName: "SettingSwitchCell", bundle: nil), forCellReuseIdentifier: "SettingSwitchCell")
    }
}

// MARK: UITableViewDataSource
extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.items[section].rowCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = self.viewModel.items[indexPath.section].type
        switch type {
        case .user:
            return self.userCell(tableView: tableView, indexPath: indexPath)
        }
    }
    
    fileprivate func userCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        if let userItem = self.viewModel.items[indexPath.section] as? UserItem {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SettingSwitchCell", for: indexPath) as? SettingSwitchCell {
                let cellType = userItem.cellTypes[indexPath.row]
                switch cellType {
                case .autoPlay:
                    cell.set(title: "自動播放", isOn: MemberRepository.shared.isAutoPlay, change: { value in
                        MemberRepository.shared.isAutoPlay = value
                    })
                case .subtitleSync:
                    cell.set(title: "字幕同步", isOn: MemberRepository.shared.isSubtitleSync, change: { value in
                        MemberRepository.shared.isSubtitleSync = value
                    })
                case .searchingWord:
                    cell.set(title: "查詢單字時暫停播放", isOn: MemberRepository.shared.isSearchingWord, change: { value in
                        MemberRepository.shared.isSearchingWord = value
                    })
                case .recommendedVideoReminder:
                    cell.set(title: "推薦影片提醒", isOn: MemberRepository.shared.isRecommendedVideoReminder, change: { value in
                        MemberRepository.shared.isRecommendedVideoReminder = value
                    })
                case .learningNotification:
                    cell.set(title: "學習通知", isOn: MemberRepository.shared.isLearningNotification, change: { value in
                        MemberRepository.shared.isLearningNotification = value
                    })
                }
                return cell
            }

        }
        return UITableViewCell()
    }
}

// MARK: SettingViewProtocol
extension SettingViewController: SettingViewProtocol {
    
}

