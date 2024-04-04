//
//  BaseDao.swift
//  portal
//
//  Created by Василий Сомов on 29.11.2018.
//  Copyright © 2018 Василий Сомов. All rights reserved.
//

import UIKit
import SQLite

class BaseDao {
    var dbConnection: Connection?
    
    init(connection: Connection?) {
        self.dbConnection = connection
    }
}
