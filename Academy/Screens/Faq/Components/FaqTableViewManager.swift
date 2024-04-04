//
//  FaqTableViewManager.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

class FaqTableViewManager: NSObject {
    
    private var dataSource: [CellModel] = []
    weak var output: FaqViewOutput?
    weak var tableView: UITableView!
    var lastContentOffset: CGFloat = 0
    
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func createCells() {
        
        tableView.register(UINib(nibName: "TitleLeftCell", bundle: nil), forCellReuseIdentifier: "TitleLeftCell")
        tableView.register(UINib(nibName: "QuestionCell", bundle: nil), forCellReuseIdentifier: "QuestionCell")
        tableView.register(UINib(nibName: "AnswerCell", bundle: nil), forCellReuseIdentifier: "AnswerCell")
        
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

extension FaqTableViewManager: UITableViewDataSource, UITableViewDelegate {
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

extension FaqTableViewManager {
    func configure(cell: ConfigurableCell, model: CellModel) {
        switch cell {
            case let cell as QuestionCell:
                cell.closureTap = { [weak self] pos in
                    guard let `self` = self else { return }
                    self.output?.questionTapped(pos: pos)
                }
                break
        default:
            break
        }
    }
}

extension FaqTableViewManager: UIScrollViewDelegate {

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
         
        
        if self.lastContentOffset < scrollView.contentOffset.y {
            
        } else if self.lastContentOffset > scrollView.contentOffset.y {
            
        } else {
            print("didn't move")
        }
    }
}
