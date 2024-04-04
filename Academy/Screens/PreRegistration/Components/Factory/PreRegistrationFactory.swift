//
//  PreRegistrationFactory.swift
//  Academy
//
//  Created by MovchanArtemiy on 03.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class PreRegistrationFactory {
    
    func build(schedules: Dictionary<String,String>) -> [CellModel] {
         
         var models = [CellModel]()

        models.append(LabelCellModel(reuseIdentifier: "labelCell"))
        models.append(ScheduleCellModel(reuseIdentifier: "scheduleCell", scheduleArray: schedules))
        models.append(MailCellModel(reuseIdentifier: "mailCell"))
        models.append(NameUserCellModel(reuseIdentifier: "nameUserCell"))
        models.append(UniversityCellModel(reuseIdentifier: "universityCell"))
        models.append(SendRequestPreRegCellModel(reuseIdentifier: "sendRequestPreRegCell"))

        
        return models
         
     }
}
