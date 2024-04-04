//
//  DetailCourseTableManager.swift
//  Academy
//
//  Created by MovchanArtemiy on 20.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

class DetailCourseTableManager: NSObject {
    
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
    tableView.register(UINib(nibName: "CoursesCell", bundle: nil), forCellReuseIdentifier: "CoursesCell")
    
    tableView.register(UINib(nibName: "ImageCell", bundle: nil), forCellReuseIdentifier: "ImageCell")
    //tableView.register(UINib(nibName: "TextCell", bundle: nil), forCellReuseIdentifier: "TextCell")
    //tableView.register(UINib(nibName: "WebViewCell", bundle: nil), forCellReuseIdentifier: "WebViewCell")
    tableView.register(UINib(nibName: "WebHeaderCell", bundle: nil), forCellReuseIdentifier: "webHeaderCell")
      tableView.register(UINib(nibName: "WebAnswerCell", bundle: nil), forCellReuseIdentifier: "webAnswerCell")
    tableView.register(UINib(nibName: "SignUpCell", bundle: nil), forCellReuseIdentifier: "signUpCell")
    tableView.register(UINib(nibName: "TableCoursesCell", bundle: nil), forCellReuseIdentifier: "tableCoursesCell")
    tableView.register(UINib(nibName: "RegistrationCell", bundle: nil), forCellReuseIdentifier: "registrationCell")
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

extension DetailCourseTableManager: UITableViewDataSource, UITableViewDelegate {
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

extension DetailCourseTableManager {
    func configure(cell: ConfigurableCell, model: CellModel) {
        switch cell {
//        case let cell as WebViewCell:
//            cell.tapClosure = { [weak self] row in
//                guard let `self` = self else { return }
//                self.output?.tapToSlideCell(row: row)
//            }
            
        case let cell as WebHeaderCell:
            cell.closureTap = { [weak self] text, id, status in
                guard let `self` = self else { return }
                print("obla id in closure \(text)")
                self.output?.tapToWebHeader(text: text, id: id, status: status)
            }
        case let cell as CourseCell:
            cell.tapClosure = { [weak self] id, tableName in
                guard let `self` = self else { return }
                self.output?.tapToDirections(id: id, tableName: tableName)
            }
            
        case let cell as RegistrationCell:
            cell.tapRegistration = { [weak self] registration in
                guard let `self` = self else { return }
                self.output?.tapToRegistration(registration: registration)
            }
            
        case let cell as TextCell:
            cell.tapClosure = { [weak self] row in
                guard let `self` = self else { return }
                self.output?.tapToTextCell(row: row)
            }
            break
        default:
            break
        }
    }
}
