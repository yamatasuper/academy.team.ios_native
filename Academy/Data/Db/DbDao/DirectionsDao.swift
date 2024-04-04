//
//  DirectionsDao.swift
//  Academy
//
//  Created by MovchanArtemiy on 29.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import SQLite

class DirectionsDao: BaseDao {
    
    func getAllDirectionsList() -> [Directions] {
        let directionsColumns = DirectionsDao.getColumns()
        if let query = try? dbConnection?.prepare(DirectionsDao.getTable().order(directionsColumns.sorting.desc)) {
            return getDirectionsList(query)
        }
        return []
    }
    
    func deleteAll() {
        _ = try? dbConnection?.run(DirectionsDao.getTable().delete())
    }
    //
    //    //@Transaction
    func deleteAndInsertAll(_ newss: [Directions]) {
        try? dbConnection?.transaction {
            deleteAll()
            insertNewsList(newss)
        }
    }
    //
    //    //@Insert(onConflict = OnConflictStrategy.REPLACE)
    private func insertNewsList(_ newss: [Directions]) {
        let directionsColumns = DirectionsDao.getColumns()
        let newsTable = DirectionsDao.getTable()
        for news in newss {
            let insertQuery = newsTable.insert(or: OnConflict.replace,
                                               directionsColumns.id <- news.id,
                                               directionsColumns.technology_id <- news.technology_id,
                                               directionsColumns.teacher_id <- news.teacher_id,
                                               directionsColumns.program <- news.program,
                                               directionsColumns.date_start <- news.date_start,
                                               directionsColumns.date_completion <- news.date_completion,
                                               directionsColumns.date_last_lesson <- news.date_last_lesson,
                                               directionsColumns.quantity_lesson <- news.quantity_lesson,
                                               directionsColumns.date_create <- news.date_create,
                                               directionsColumns.date_update <- news.date_update,
                                               directionsColumns.status <- news.status,
                                               directionsColumns.code <- news.code,
                                               directionsColumns.publish <- news.publish,
                                               directionsColumns.sorting <- news.sorting,
                                               directionsColumns.responsible_id <- news.responsible_id,
                                               directionsColumns.registration <- news.registration,
                                               directionsColumns.technology_title <- news.technology_title,
                                               directionsColumns.technology_sub_title <- news.technology_sub_title,
                                               directionsColumns.status_label <- news.status_label,
                                               directionsColumns.right_description <- news.right_description,
                                               directionsColumns.left_description <- news.left_description,
                                               directionsColumns.userName <- news.userName,
                                               directionsColumns.position <- news.position
                
            )
            
            
            let _ = try? dbConnection?.run(insertQuery)
        }
    }
    //
    //    //@Query("SELECT * FROM user WHERE id = :id")
    func findDirectionById(id: Int) -> Directions? {
        let directionsColumns = DirectionsDao.getColumns()
        if let query = try? dbConnection?.prepare(DirectionsDao.getTable().where(directionsColumns.id == id)) {
            let directions = getDirectionsList(query)
            return directions.first
        }
        return nil
    }

    private func getDirectionsList(_ rows: AnySequence<Row>? ) -> [Directions] {
        var directionsList: [Directions] = []
        guard let rows = rows else {
            return directionsList
        }

        let directionsColumns = DirectionsDao.getColumns()
        var directions: Directions
        for row in rows {
            directions = Directions()
            directions.id = row[directionsColumns.id]
            directions.technology_id = row[directionsColumns.technology_id]
            directions.teacher_id = row[directionsColumns.teacher_id]
            directions.program = row[directionsColumns.program]
            directions.date_start = row[directionsColumns.date_start]
            directions.date_completion = row[directionsColumns.date_completion]
            directions.date_last_lesson = row[directionsColumns.date_last_lesson]
            directions.quantity_lesson = row[directionsColumns.quantity_lesson]
            directions.date_create = row[directionsColumns.date_create]
            directions.date_update = row[directionsColumns.date_update]
            directions.status = row[directionsColumns.status]
            directions.code = row[directionsColumns.code]
            directions.publish = row[directionsColumns.publish]
            directions.sorting = row[directionsColumns.sorting]
            directions.responsible_id = row[directionsColumns.responsible_id]
            directions.registration = row[directionsColumns.registration]
            directions.technology_title = row[directionsColumns.technology_title]
            directions.technology_sub_title = row[directionsColumns.technology_sub_title]
            directions.status_label = row[directionsColumns.status_label]
            directions.right_description = row[directionsColumns.right_description]
            directions.left_description = row[directionsColumns.left_description]
            directions.userName = row[directionsColumns.userName]
            directions.position = row[directionsColumns.position]
            
            
            directionsList.append(directions)
        }
        return directionsList
    }
    
    static func getTable() -> Table {
        return Table(directionsTableName)
    }

    static func getColumns() -> directionsColumns {
        return directionsColumns()
    }

    
    struct directionsColumns {
        var id = Expression<Int>("id")
        var technology_id = Expression<Int>("technology_id")
        var teacher_id = Expression<Int>("teacher_id")
        var program = Expression<String>("program")
        var date_start = Expression<String>("date_start")
        var date_completion = Expression<String>("date_completion")
        var date_last_lesson = Expression<String>("date_last_lesson")
        var quantity_lesson = Expression<Int>("quantity_lesson")
        var date_create = Expression<String>("date_create")
        var date_update = Expression<String>("date_update")
        var update_by = Expression<Int>("update_by")
        var status = Expression<String>("status")
        var code = Expression<String>("code")
        var publish = Expression<String>("publish")
        var sorting = Expression<Int>("sorting")
        var responsible_id = Expression<Int>("responsible_id")
        var registration = Expression<Bool>("registration")
        var technology_title = Expression<String>("technology_title")
        var technology_sub_title = Expression<String>("technology_sub_title")
        var status_label = Expression<String>("status_label")
        var right_description = Expression<String>("right_description")
        var left_description = Expression<String>("left_description")
        var userName = Expression<String>("userName")
        var position = Expression<String>("position")

    }
    
}
