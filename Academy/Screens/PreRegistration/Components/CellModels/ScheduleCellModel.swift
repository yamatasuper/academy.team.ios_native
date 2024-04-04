//
//  ScheduleCellModel.swift
//  Academy
//
//  Created by MovchanArtemiy on 03.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class ScheduleCellModel: CellModel {
    var reuseIdentifier = "scheduleCell"
    var scheduleArray: Dictionary<String, String>
    
    
    init(reuseIdentifier: String, scheduleArray:Dictionary<String, String>) {
        self.reuseIdentifier = reuseIdentifier
        self.scheduleArray = scheduleArray
    }
}
