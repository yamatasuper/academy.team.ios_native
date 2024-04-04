//
//  Schedules.swift
//  Academy
//
//  Created by MovchanArtemiy on 22.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import SQLite

class SchedulesDao: BaseDao {
    
    func getAllSchedulesList() -> [Schedules] {
        let schedulesColumns = SchedulesDao.getColumns()
        if let query = try? dbConnection?.prepare(SchedulesDao.getTable().order(schedulesColumns.sorting.desc)) {
            return getSchedulesList(query)
        }
        return []
    }
    
    func deleteAll() {
        _ = try? dbConnection?.run(SchedulesDao.getTable().delete())
    }
    
    //@Transaction
    func deleteAndInsertAll(_ newss: [Schedules]) {
        try? dbConnection?.transaction {
            deleteAll()
            insertNewsList(newss)
        }
    }
    
    //@Insert(onConflict = OnConflictStrategy.REPLACE)
    private func insertNewsList(_ newss: [Schedules]) {
        let schedulesColumns = SchedulesDao.getColumns()
        let newsTable = SchedulesDao.getTable()
        for news in newss {
            let insertQuery = newsTable.insert(or: OnConflict.replace,
                                               schedulesColumns.id <- news.id,
                                               schedulesColumns.technology_name <- news.technology_name,
                                               schedulesColumns.status <- news.status,
                schedulesColumns.code <- news.code,
                schedulesColumns.right_description <- news.right_description,
                schedulesColumns.left_description <- news.left_description,
                schedulesColumns.program <- news.program,
                schedulesColumns.userName <- news.userName,
                schedulesColumns.position <- news.position,
                schedulesColumns.registration <- news.registration,
                schedulesColumns.weekly_for_header_detail <- news.weekly_for_header_detail,
                schedulesColumns.monday <- news.monday,
                schedulesColumns.tuesday <- news.tuesday,
                schedulesColumns.wednesday <- news.wednesday,
                schedulesColumns.thursday <- news.thursday,
                schedulesColumns.friday <- news.friday,
                schedulesColumns.saturday <- news.saturday,
                schedulesColumns.sunday <- news.sunday
            )
            
            let _ = try? dbConnection?.run(insertQuery)
        }
    }
    
    //@Query("SELECT * FROM user WHERE id = :id")
    func findCourseById(id: Int) -> Schedules? {
        let schedulesColumns = SchedulesDao.getColumns()
        if let query = try? dbConnection?.prepare(SchedulesDao.getTable().where(schedulesColumns.id == id)) {
            let schedules = getSchedulesList(query)
            return schedules.first
        }
        return nil
    }
    
    private func getSchedulesList(_ rows: AnySequence<Row>? ) -> [Schedules] {
        var schedulesList: [Schedules] = []
        guard let rows = rows else {
            return schedulesList
        }
        
        let schedulesColumns = SchedulesDao.getColumns()
        var schedules: Schedules
        for row in rows {
            schedules = Schedules()
            schedules.id = row[schedulesColumns.id]
            schedules.technology_name = row[schedulesColumns.technology_name]
            schedules.status = row[schedulesColumns.status]
            schedules.code = row[schedulesColumns.code]
            schedules.right_description = row[schedulesColumns.right_description]
            schedules.left_description = row[schedulesColumns.left_description]
            schedules.program = row[schedulesColumns.program]
            schedules.registration = row[schedulesColumns.registration]
            schedules.weekly_for_header_detail = row[schedulesColumns.weekly_for_header_detail]
            schedules.userName = row[schedulesColumns.userName]
            schedules.position = row[schedulesColumns.position]
            schedules.monday = row[schedulesColumns.monday]
            schedules.tuesday = row[schedulesColumns.tuesday]
            schedules.wednesday = row[schedulesColumns.wednesday]
            schedules.thursday = row[schedulesColumns.thursday]
            schedules.friday = row[schedulesColumns.friday]
            schedules.saturday = row[schedulesColumns.saturday]
            schedules.sunday = row[schedulesColumns.sunday]
            schedulesList.append(schedules)
        }
        return schedulesList
    }
    
    static func getTable() -> Table {
        return Table(schedulesTableName)
    }
    
    static func getColumns() -> schedulesColumns {
        return schedulesColumns()
    }
    
    struct schedulesColumns {
        let newsTable = Table("schedules")
        let id = Expression<Int>("id")
        let status = Expression<String>("status")
        let technology_name = Expression<String>("technology_name")
        let sorting = Expression<Int>("sorting")
        let code = Expression<String>("code")
        let publish = Expression<Bool>("publish")
        let sub_technology_name = Expression<String>("sub_technology_name")
        let right_description = Expression<String>("right_description")
        let left_description = Expression<String>("left_description")
        let program = Expression<String>("program")
        let registration = Expression<Bool>("registration")
        let responsible = Expression<Responsible>("responsible")
        let weekly = Expression<Weekly>("weekly")
        let weekly_for_header_detail = Expression<String>("weekly_for_header_detail")
        let is_finished = Expression<Bool>("is_finished")
        let userName = Expression<String>("userName")
        let position = Expression<String>("position")
        let monday = Expression<String>("monday")
        let tuesday = Expression<String>("tuesday")
        let wednesday = Expression<String>("wednesday")
        let thursday = Expression<String>("thursday")
        let friday = Expression<String>("friday")
        let saturday = Expression<String>("saturday")
        let sunday = Expression<String>("sunday")
    }
}
