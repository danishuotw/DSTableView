//
//  VideoListViewController.swift
//  DSTableView
//
//  Created by Danishuo on 09/04/2018.
//  Copyright © 2018 ettoday. All rights reserved.
//

import UIKit

class VideoListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    lazy var viewModel: VideoListViewModel = {
        return VideoListViewModel(delegate: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.viewModel.fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.visibleCells.forEach {
            ($0 as? VideoListCell)?.updateReadStatus()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("VideoListViewController deinit")
    }
    
    private func setup() {
        self.navigationItem.title = "Video"
        self.tableView.register(UINib(nibName: "VideoListCell", bundle: nil), forCellReuseIdentifier: "VideoListCell")
    }
}

// MARK: VideoListViewProtocol
extension VideoListViewController: VideoListViewProtocol {
    func updateUI() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()
    }
}

// MARK: UITableViewDelegate
extension VideoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return VIDEO_CELL_HEIGHT
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = self.viewModel.videoList.videos.count - 1
        if indexPath.row == lastElement {
            self.viewModel.fetchData()
        }
    }
}

// MARK: UITableViewDataSource
extension VideoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.videoList.videos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "VideoListCell", for: indexPath) as? VideoListCell {
            cell.configureCell(model: self.viewModel.videoList.videos[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}
