//
//  VideoListViewModel.swift
//  DSTableView
//
//  Created by Danishuo on 09/04/2018.
//  Copyright © 2018 ettoday. All rights reserved.
//

import RxSwift
import Foundation

class VideoListViewModel {
    let dispose = DisposeBag()
    weak var delegate: VideoListViewProtocol?
    var videoList = VideoListModel()
    
    init(delegate: VideoListViewProtocol) {
        self.delegate = delegate
    }
}

// MARK: VideoListViewModelProtocol
extension VideoListViewModel: VideoListViewModelProtocol {
    func fetchData() {
        VideoListRepository.shared.getVideoListData()
        .subscribe(onNext: { (model) in
            model.videos.forEach({ (videoModel) in
                self.videoList.videos.append(videoModel)
            })
            self.delegate?.updateUI()
        }, onError: { (error) in
            print("FetchData Error\(error.localizedDescription)")
        }, onCompleted: {
            print("onCompleted")
        }).disposed(by: dispose)
    }
}
