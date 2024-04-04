//
//  TableGroupsManager.swift
//  Academy
//
//  Created by MovchanArtemiy on 29.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

class TableGroupsManager: NSObject {
    
    weak var tableView: UITableView!
    private var dataSource: [CellModel] = []
    
    weak var output: DetailCourseViewOutput?
    
    var isExpanded: Bool!
    var factory = CoursesTableFactory()

    init(tableView: UITableView) {
       self.tableView = tableView
       super.init()
       
       tableView.delegate = self
       tableView.dataSource = self
        
        setCells()
    }
       
       
   func setCells() {
    tableView.register(UINib(nibName: "ImageCell", bundle: nil), forCellReuseIdentifier: "ImageCell")
    tableView.register(UINib(nibName: "TextCell", bundle: nil), forCellReuseIdentifier: "TextCell")
    tableView.register(UINib(nibName: "WebViewCell", bundle: nil), forCellReuseIdentifier: "WebViewCell")
    tableView.register(UINib(nibName: "SignUpCell", bundle: nil), forCellReuseIdentifier: "signUpCell")
    tableView.register(UINib(nibName: "TableCoursesCell", bundle: nil), forCellReuseIdentifier: "tableCoursesCell")
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
}

extension TableGroupsManager: UITableViewDataSource, UITableViewDelegate {
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

extension TableGroupsManager {
    func configure(cell: ConfigurableCell, model: CellModel) {
        switch cell {
        case let cell as WebViewCell:
            cell.tapClosure = { [weak self] row in
                guard let `self` = self else { return }
                self.output?.tapToSlideCell(row: row)
            }
            break
        default:
            break
        }
    }
}
