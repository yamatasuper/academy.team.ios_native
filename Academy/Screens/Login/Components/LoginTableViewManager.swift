//
//  LoginTableViewManager.swift
//  Academy
//
//  Created by Sergey Dimitriev on 14.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

class LoginTableViewManager: NSObject {
    
    weak var tableView: UITableView!
    var dataSource: [CellModel] = []
    
    weak var output: LoginViewOutput?
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func createCells() {
        
        tableView.register(UINib(nibName: "LogoCell", bundle: nil), forCellReuseIdentifier: "LogoCell")
        tableView.register(UINib(nibName: "PassCell", bundle: nil), forCellReuseIdentifier: "PassCell")
        tableView.register(UINib(nibName: "SubmitCell", bundle: nil), forCellReuseIdentifier: "SubmitCell")
        tableView.register(UINib(nibName: "SkipCell", bundle: nil), forCellReuseIdentifier: "SkipCell")
    }
    
    func setModels(_ models: [CellModel]) {
        self.createCells()
        self.dataSource = models
        tableView.reloadData()
    }
    
    func setModel(_ model: CellModel, index: Int) {
        self.dataSource[index] = model
        tableView.reloadRows(at: [IndexPath.init(row: index, section: 0)], with: .none)
    }
}

extension LoginTableViewManager: UITableViewDataSource, UITableViewDelegate {
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

extension LoginTableViewManager {
    func configure(cell: ConfigurableCell, model: CellModel) {
        switch cell {
            case let cell as SubmitCell:
                cell.closureTap = { [weak self] status in
                    guard let `self` = self else { return }
                    self.output?.submitTapped()
                }
                break
            case let cell as PassCell:
                cell.closurePassText = { [weak self] password in
                    guard let `self` = self else { return }
                    self.output?.savePasswordFieldText(password: password)
                }
                break
            case let cell as SkipCell:
                cell.closureTap = { [weak self] status in
                    guard let `self` = self else { return }
                    self.output?.tappedResetButton()
                }
                break
        default:
            break
        }
    }
}
