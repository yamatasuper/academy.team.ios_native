//
//  UserInfoModel.swift
//  Academy
//
//  Created by Sergey Dimitriev on 27.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class UserInfoModel: CellModel {
    let reuseIdentifier = "UserInfoCell"
    var title: String = ""
    var text: String = ""
    
    init(title: String, text: String) {
        self.title = title
        self.text = text
    }
}
