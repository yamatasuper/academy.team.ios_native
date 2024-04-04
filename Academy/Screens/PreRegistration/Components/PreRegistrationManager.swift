//
//  PreRegistrationManager.swift
//  Academy
//
//  Created by MovchanArtemiy on 03.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

class PreRegistrationManager: NSObject {
        //let dropView = DropDownView()
//let dropView = DropDownBtn()
    
    weak var tableView: UITableView!
    private var dataSource: [CellModel] = []
    
    weak var output: PreRegistrationViewOutput?
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        createCells()
    
    }
    
    private func createCells() {
        
        tableView.register(UINib(nibName: "LabelCell", bundle: nil), forCellReuseIdentifier: "labelCell")
        tableView.register(UINib(nibName: "ScheduleCell", bundle: nil), forCellReuseIdentifier: "scheduleCell")
        tableView.register(UINib(nibName: "MailCell", bundle: nil), forCellReuseIdentifier: "mailCell")
        tableView.register(UINib(nibName: "NameUserCell", bundle: nil), forCellReuseIdentifier: "nameUserCell")
        tableView.register(UINib(nibName: "UniversityCell", bundle: nil), forCellReuseIdentifier: "universityCell")
        tableView.register(UINib(nibName: "SendRequestPreReg", bundle: nil), forCellReuseIdentifier: "sendRequestPreRegCell")
        
        
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

extension PreRegistrationManager: UITableViewDataSource, UITableViewDelegate {
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

extension PreRegistrationManager {
    func configure(cell: ConfigurableCell, model: CellModel) {
        switch cell {
            case let cell as MailCell:
                cell.closureEmailText = { [weak self] email in
                    guard let `self` = self else { return }
                    self.output?.saveEmailFieldText(email: email)
                }
                break
        case let cell as NameUserCell:
            cell.closureNameText = { [weak self] userName in
                guard let `self` = self else { return }
                self.output?.saveNameFieldText(userName: userName)
            }
            break
            case let cell as UniversityCell:
                cell.closureUniversityText = { [weak self] universityName in
                     guard let `self` = self else { return }
                     self.output?.saveUniversityFieldText(universityName: universityName)
                 }
                 break
            case let cell as SendRequestPreRegCell:
                cell.closureNextButtonTapped = { [weak self] status in
                    guard let `self` = self else { return }
                    self.output?.goValidateEmail()
                }
            break
        case let cell as ScheduleCell:
            cell.closureInSchedule  = { [weak self] schedule in
                guard let `self` = self else { return }
                self.output?.saveScheduleText(schedule: schedule)
            }
        break
            
//        case let cell as UserInfoCell:
//                 cell.closureUserText  = { [weak self] userName in
//                    guard let `self` = self else { return }
//                    //self.output?.saveNameFieldText(userName: userName)
//                    print("vobla \(userName)")
//                 }

        break
            

        default:
            break
        }
  
    }
}

