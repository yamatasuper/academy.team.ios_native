//
//  DBRepository.swift
//  portal
//
//  Created by Василий Сомов on 29.11.2018.
//  Copyright © 2018 Василий Сомов. All rights reserved.
//

import UIKit
import Foundation
import SQLite

class DBRepository {
    
    private static var dataBase = DataBase()
    
    static func userDao() -> UserDao {
        return dataBase.userDao
    }
    static func faqDao() -> FaqDao {
        return dataBase.faqDao
    }
    static func removeUserData() {
        dataBase.userDao.deleteAll()
    }
    
    static func schedulesTable() -> SchedulesDao {
        dataBase.schedulesTable
    }
    
    static func groupsTable() -> GroupsDao {
        dataBase.groupsTable
    }
    
    static func examPrepareTable() -> ExamPrepareDao {
        dataBase.examPrepareTable
    }
    
    static func directionsTable() -> DirectionsDao {
        dataBase.directionsTable
    }
}

private class DataBase {
    private var db: Connection?
    private var migrationManager: SQLiteMigrationManager?
    
    let userDao: UserDao
    let faqDao: FaqDao
    let schedulesTable: SchedulesDao
    let groupsTable: GroupsDao
    let examPrepareTable: ExamPrepareDao
    let directionsTable: DirectionsDao
    
    init() {
        do {
            let databaseFilePath = "\(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])/\(dbFileName)"
            let connection = try Connection(databaseFilePath)
            let manager = SQLiteMigrationManager(db: connection, migrations: [ InitMigration()],
                                                 bundle: Bundle.main)
            
            if !manager.hasMigrationsTable() {
                try manager.createMigrationsTable()
            }
            
            if manager.needsMigration() {
                try manager.migrateDatabase()
            }
            
            db = connection
            migrationManager = manager
            
        } catch {
            print(error)
        }
        
        userDao = UserDao(connection: db)
        faqDao = FaqDao(connection: db)
        schedulesTable = SchedulesDao(connection: db)
        groupsTable = GroupsDao(connection: db)
        examPrepareTable = ExamPrepareDao(connection: db)
        directionsTable = DirectionsDao(connection: db)
    }
    
}
