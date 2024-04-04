//
//  AuthTableViewManager.swift
//  Academy
//
//  Created by Sergey Dimitriev on 13.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

class AuthTableViewManager: NSObject {
    
    weak var tableView: UITableView!
    var dataSource: [CellModel] = []
    
    weak var output: AuthViewOutput?
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func createCells() {
        
        tableView.register(UINib(nibName: "LogoCell", bundle: nil), forCellReuseIdentifier: "LogoCell")
        tableView.register(UINib(nibName: "EmailAuthCell", bundle: nil), forCellReuseIdentifier: "EmailAuthCell")
        tableView.register(UINib(nibName: "SkipCell", bundle: nil), forCellReuseIdentifier: "SkipCell")
        tableView.register(UINib(nibName: "TaglineCell", bundle: nil), forCellReuseIdentifier: "TaglineCell")
        
    }
    
    func setModels(_ models: [CellModel]) {
        self.createCells()
        self.dataSource = models
        tableView.reloadData()
    }
}

extension AuthTableViewManager: UITableViewDataSource, UITableViewDelegate {

    
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

extension AuthTableViewManager {
    func configure(cell: ConfigurableCell, model: CellModel) {
        switch cell {
            case let cell as EmailAuthCell:
                cell.closureEmailText = { [weak self] email in
                    guard let `self` = self else { return }
                    self.output?.saveEmailFieldText(email: email)
                }
                cell.closureNextButtonTapped = { [weak self] status in
                    guard let `self` = self else { return }
                    self.output?.goValidateEmail()
                }
                break
            case let cell as SkipCell:
                cell.closureTap = { [weak self] status in
                    guard let `self` = self else { return }
                    self.output?.goToTabScreen()
                }
                break
        default:
            break
        }
    }
}
