//
//  FormQuestionTableViewManager.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

class FormQuestionTableViewManager: NSObject {
    
    weak var tableView: UITableView!
    private var dataSource: [CellModel] = []
    var lastContentOffset: CGFloat = 0
    
    weak var output: FormQuestionViewOutput?
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func createCells() {
        tableView.register(UINib(nibName: "TitleCell", bundle: nil), forCellReuseIdentifier: "TitleCell")
        tableView.register(UINib(nibName: "EmailQuestionCell", bundle: nil), forCellReuseIdentifier: "EmailQuestionCell")
        tableView.register(UINib(nibName: "NameQuestionCell", bundle: nil), forCellReuseIdentifier: "NameQuestionCell")
        tableView.register(UINib(nibName: "UniversityQuestionCell", bundle: nil), forCellReuseIdentifier: "UniversityQuestionCell")
        tableView.register(UINib(nibName: "ButtonQuestionCell", bundle: nil), forCellReuseIdentifier: "ButtonQuestionCell")
        tableView.register(UINib(nibName: "TextQuestionCell", bundle: nil), forCellReuseIdentifier: "TextQuestionCell")
        
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

extension FormQuestionTableViewManager: UITableViewDataSource, UITableViewDelegate {
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

extension FormQuestionTableViewManager {
    func configure(cell: ConfigurableCell, model: CellModel) {
        switch cell {
            case let cell as ButtonQuestionCell:
                cell.closureTap = { [weak self] status in
                    guard let `self` = self else { return }
                    self.output?.buttonSubmit()
                }
            break
            case let cell as EmailQuestionCell:
                cell.closureText = { [weak self] text in
                    guard let `self` = self else { return }
                    self.output?.emailChanged(text: text)
                }
            break
            case let cell as NameQuestionCell:
                cell.closureText = { [weak self] text in
                    guard let `self` = self else { return }
                    self.output?.nameChanged(text: text)
                }
            break
            case let cell as TextQuestionCell:
                cell.closureText = { [weak self] text in
                    guard let `self` = self else { return }
                    self.output?.textChanged(text: text)
                }
            break
        default:
            break
        }
    }
}
