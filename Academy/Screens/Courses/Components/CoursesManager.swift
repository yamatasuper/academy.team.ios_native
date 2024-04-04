//
//  CoursesManager.swift
//  Academy
//
//  Created by MovchanArtemiy on 10.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

class CoursesViewManager: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    weak var tableView: UITableView!
    weak var output: CoursesViewOutput?
    private var dataSource: [CellModel] = []
    var isExpanded: Bool!
    var lastContentOffset: CGFloat = 0
    var flag: Bool = false
    var tapClosure: ((Bool) -> Void)?
    
    init(tableView: UITableView, output: CoursesViewOutput) {
        
        self.tableView = tableView
        self.output = output
        super.init()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setCells()
    }
    
    
    func setCells() {
        
        //для ячейки со всеми полями
        tableView.register(UINib(nibName: "FilterCell", bundle: nil), forCellReuseIdentifier: "filterCell")
        tableView.register(UINib(nibName: "CoursesCell", bundle: nil), forCellReuseIdentifier: "CoursesCell")
        
    }
    
    func set(models: [CellModel]) {
        dataSource = models
        
    }
    
    func set(model: CellModel, row: Int) {
        
        if row < dataSource.count {
            
            dataSource.remove(at: row)
            dataSource.insert(model, at: row)
            
            if let cell = tableView.cellForRow(at: IndexPath(row: row, section: 0 )) as? ConfigurableCell  {
                cell.config(model: model)
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = dataSource[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: model.reuseIdentifier, for: indexPath) as? ConfigurableCell else {
            return UITableViewCell()
        }
        
        cell.config(model: model)
        
        configure(cell: cell, model: model)
        
        return cell
    }
    
}

extension CoursesViewManager {
    func configure(cell: ConfigurableCell, model: CellModel) {
        switch cell {
        case let cell as CourseCell:
            
            cell.tapDetail = { [weak self] id, tableName in
                guard let `self` = self else { return }
                self.output?.tapToDetail(id: id, tableName: tableName )
            }
            break
            
        case let cell as FilterCell:
            cell.tapFilter = { [weak self] filter in
                guard let `self` = self else { return }
                self.output?.tapToFilter(filter: filter)
            }
            break
        default:
            break
        }
    }
}

extension CoursesViewManager: UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.lastContentOffset < scrollView.contentOffset.y {
            //print("did move up")
            tapClosure?(true)
        } else if self.lastContentOffset > scrollView.contentOffset.y {
            //print("did move down")
            tapClosure?(false)
        } else {
            //print("didn't move")
        }
    }
}
