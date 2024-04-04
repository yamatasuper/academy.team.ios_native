//
//  UserDao.swift
//  portal
//
//  Created by Василий Сомов on 29.11.2018.
//  Copyright © 2018 Василий Сомов. All rights reserved.
//

import UIKit
import SQLite

class UserDao: BaseDao {
    
    //@Query("SELECT * FROM user")
    func getAllUsers() -> [User] {
        if let query = try? dbConnection?.prepare(UserDao.getTable()) {
            return getUserList(query)
        }
        return []
    }
    
    //@Query("DELETE FROM user")
    func deleteAll() {
        _ = try? dbConnection?.run(UserDao.getTable().delete())
    }
    
    //@Transaction
    func deleteAllAndInsert(_ user: User) {
        try? dbConnection?.transaction {
            deleteAll()
            insertUser(user)
        }
    }
    
    //@Insert(onConflict = OnConflictStrategy.REPLACE)
    private func insertUser(_ user: User) {
        let userColumns = UserDao.getColumns()
        let userTable = UserDao.getTable()
        _ = try? dbConnection?.run(userTable.insert(
            userColumns.id <- user.id,
            userColumns.email <- user.email,
            userColumns.password <- user.password,
            userColumns.token <- user.token,
            userColumns.name <- user.name,
            userColumns.social <- user.social
        ))
    }
    
    //@Query("SELECT * FROM user WHERE id = :id")
    func findUserById(id: Int64) -> User? {
        let userColumns = UserDao.getColumns()
        if let query = try? dbConnection?.prepare(UserDao.getTable().where(userColumns.id == id)) {
            let users = getUserList(query)
            return users.first
        }
        return nil
    }
    
    private func getUserList(_ rows: AnySequence<Row>? ) -> [User] {
        var users: [User] = []
        if rows == nil  {
            return users
        }
        
        let userColumns = UserDao.getColumns()
        var user: User
        for row in rows! {
            user = User()
            user.id = row[userColumns.id]
            user.email = row[userColumns.email]
            user.password = row[userColumns.password]
            user.token = row[userColumns.token]
            user.name = row[userColumns.name]
            user.social = row[userColumns.social]
            users.append(user)
        }
        return users
    }
    
    //
    static func getTable() -> Table {
        return Table(userTableName)
    }
    
    static func getColumns() -> UserColumns {
        return UserColumns()
    }
    
    struct UserColumns {
        let id = Expression<Int64>("id")
        let email = Expression<String>("email")
        let password = Expression<String>("password")
        let token = Expression<String>("token")
        let name = Expression<String>("name")
        let social = Expression<String>("social")
    }
}
