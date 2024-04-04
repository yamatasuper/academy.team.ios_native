//
//  AboutTableViewManager.swift
//  Academy
//
//  Created by Sergey Dimitriev on 13.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

class AboutTableViewManager: NSObject {
    
    weak var tableView: UITableView!
    weak var output: AboutViewOutput?
    var dataSource: [CellModel] = []
    var lastContentOffset: CGFloat = 0
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func createCells() {
        
        tableView.register(UINib(nibName: "TitleLeftCell", bundle: nil), forCellReuseIdentifier: "TitleLeftCell")
        tableView.register(UINib(nibName: "AboutTextCell", bundle: nil), forCellReuseIdentifier: "AboutTextCell")
        tableView.register(UINib(nibName: "SocialCell", bundle: nil), forCellReuseIdentifier: "SocialCell")
        tableView.register(UINib(nibName: "MapCell", bundle: nil), forCellReuseIdentifier: "MapCell")
    }
    
    func setModels(_ models: [CellModel]) {
        self.createCells()
        self.dataSource = models
        tableView.reloadData()
    }
}

extension AboutTableViewManager: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = dataSource[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: model.reuseIdentifier, for: indexPath) as? ConfigurableCell else {
            return UITableViewCell()
        }
        cell.config(model: model)
        
        cell.backgroundColor = .clear
        
        configure(cell: cell, model: model)
        return cell
    }
}

extension AboutTableViewManager {
    func configure(cell: ConfigurableCell, model: CellModel) {
        switch cell {
//            case let cell as SkipCell:
//                cell.closureTap = { [weak self] status in
//                    guard let `self` = self else { return }
//                    self.output?.goToTabScreen()
//                }
//                break
        default:
            break
        }
    }
}

extension AboutTableViewManager: UIScrollViewDelegate {

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let indexPath = IndexPath(item: 0, section: 0)
        if self.lastContentOffset < scrollView.contentOffset.y {
            if !((tableView.indexPathsForVisibleRows?.contains(indexPath))!) {
                output?.toggleLogo(status: true)
            }
        } else if self.lastContentOffset > scrollView.contentOffset.y {
            if ((tableView.indexPathsForVisibleRows?.contains(indexPath))!) {
                output?.toggleLogo(status: false)
            }
        } else {
            print("didn't move")
        }
    }
}
