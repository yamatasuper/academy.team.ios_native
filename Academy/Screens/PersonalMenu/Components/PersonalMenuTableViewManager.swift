//
//  PersonalMenuTableViewManager.swift
//  Academy
//
//  Created by Sergey Dimitriev on 11.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

class PersonalMenuTableViewManager: NSObject {
    
    weak var tableView: UITableView!
    weak var output: PersonalMenuViewOutput?
    var dataSource: [CellModel] = []
    var lastContentOffset: CGFloat = 0
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func createCells() {
        
        tableView.register(UINib(nibName: "MenuLinkCell", bundle: nil), forCellReuseIdentifier: "MenuLinkCell")
    }
    
    func setModels(_ models: [CellModel]) {
        self.createCells()
        self.dataSource = models
        tableView.reloadData()
    }
}

extension PersonalMenuTableViewManager: UITableViewDataSource, UITableViewDelegate {
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

extension PersonalMenuTableViewManager {
    func configure(cell: ConfigurableCell, model: CellModel) {
        switch cell {
            case let cell as MenuLinkCell:
                cell.closureTap = { [weak self] tag in
                    guard let `self` = self else { return }
                    self.output?.menuLinkTapped(tag: tag)
                }
                break
        default:
            break
        }
    }
}
