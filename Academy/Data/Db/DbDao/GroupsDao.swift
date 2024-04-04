//
//  GroupsDao.swift
//  Academy
//
//  Created by MovchanArtemiy on 23.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import SQLite

class GroupsDao: BaseDao {
    
    func getAllGroupsList() -> [Groups] {
        let groupsColumns = GroupsDao.getColumns()
        if let query = try? dbConnection?.prepare(GroupsDao.getTable().order(groupsColumns.sorting.desc)) {
            return getGroupsList(query)
        }
        return []
    }
    
    func deleteAll() {
        _ = try? dbConnection?.run(GroupsDao.getTable().delete())
    }
    
    //@Transaction
    func deleteAndInsertAll(_ newss: [Groups]) {
        try? dbConnection?.transaction {
            deleteAll()
            insertNewsList(newss)
        }
    }
    
    //@Insert(onConflict = OnConflictStrategy.REPLACE)
    private func insertNewsList(_ newss: [Groups]) {
        let groupsColumns = GroupsDao.getColumns()
        let newsTable = GroupsDao.getTable()
        for news in newss {
            let insertQuery = newsTable.insert(or: OnConflict.replace,
                                               groupsColumns.id <- news.id,
                                               groupsColumns.title <- news.title,
                                               groupsColumns.full_title <- news.full_title,
                                               groupsColumns.code <- news.code,
                                               groupsColumns.status <- news.status,
                                               groupsColumns.sorting <- news.sorting,
                                               groupsColumns.left_side <- news.left_side,
                                               groupsColumns.right_side <- news.right_side,
                                               groupsColumns.weekly_table <- news.weekly_table,
                                               groupsColumns.userName <- news.userName,
                                               groupsColumns.position <- news.position)
            
            let _ = try? dbConnection?.run(insertQuery)
        }
    }
    
    //@Query("SELECT * FROM user WHERE id = :id")
    func findCourseById(id: Int) -> Groups? {
        let groupsColumns = GroupsDao.getColumns()
        if let query = try? dbConnection?.prepare(GroupsDao.getTable().where(groupsColumns.id == id)) {
            let groups = getGroupsList(query)
            return groups.first
        }
        return nil
    }
    
    private func getGroupsList(_ rows: AnySequence<Row>? ) -> [Groups] {
        var groupsList: [Groups] = []
        guard let rows = rows else {
            return groupsList
        }
        
        let groupsColumns = GroupsDao.getColumns()
        var groups: Groups
        for row in rows {
            groups = Groups()
            groups.id = row[groupsColumns.id]
            groups.title = row[groupsColumns.title]
            groups.full_title = row[groupsColumns.full_title]
            groups.status = row[groupsColumns.status]
            groups.sorting = row[groupsColumns.sorting]
            groups.code = row[groupsColumns.code]
            groups.left_side = row[groupsColumns.left_side]
            groups.right_side = row[groupsColumns.right_side]
            groups.weekly_table = row[groupsColumns.weekly_table]
            groups.userName = row[groupsColumns.userName]
            groups.position = row[groupsColumns.position]
            groupsList.append(groups)
        }
        return groupsList
    }
    
    static func getTable() -> Table {
        return Table(groupsTableName)
    }
    
    static func getColumns() -> groupsColumns {
        return groupsColumns()
    }
    
    struct groupsColumns {
        let newsTable = Table("groups")
        let id = Expression<Int>("id")
        let status = Expression<String>("status")
        let title = Expression<String>("title")
        let full_title = Expression<String>("full_title")
        let code = Expression<String>("code")
        let sorting = Expression<Int>("sorting")
        let left_side = Expression<String>("left_side")
        let right_side = Expression<String>("right_side")
        let weekly_table = Expression<String>("weekly_table")
        let userName = Expression<String>("userName")
        let position = Expression<String>("position")
    }
}
