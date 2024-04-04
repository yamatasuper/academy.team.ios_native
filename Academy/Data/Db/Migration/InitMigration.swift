//
//  DbMigrations.swift
//  portal
//
//  Created by Василий Сомов on 29.11.2018.
//  Copyright © 2018 Василий Сомов. All rights reserved.
//

import UIKit
import SQLite

struct InitMigration: Migration {
    var version: Int64 = 2018_11_30_11_30_00
    
    func migrateDatabase(_ db: Connection) throws {
        try createUserTable(db)
        try createFaqTable(db)
        try createSchedulesTable(db)
        try createGroupsTable(db)
        try createExamPrepareTable(db)
        try createDirectionsTable(db)
    }
    
    private func createUserTable(_ db: Connection) throws {
        let userTable = Table("user")
        let id = Expression<Int64>("id")
        let email = Expression<String>("email")
        let password = Expression<String>("password")
        let token = Expression<String>("token")
        let name = Expression<String>("name")
        let social = Expression<String>("social")
        
        try db.run(userTable.create { t in
            t.column(id, primaryKey: true)
            t.column(email, defaultValue: "")
            t.column(password, defaultValue: "")
            t.column(token, defaultValue: "")
            t.column(name, defaultValue: "")
            t.column(social, defaultValue: "")
        })
    }
    
    private func createFaqTable(_ db: Connection) throws {
        let userTable = Table("faq")
        let id = Expression<Int64>("id")
        let question = Expression<String>("question")
        let answer = Expression<String>("answer")
        let sorting = Expression<Int64>("sorting")
        
        try db.run(userTable.create { t in
            t.column(id, primaryKey: true)
            t.column(question, defaultValue: "")
            t.column(answer, defaultValue: "")
            t.column(sorting, defaultValue: 0)
            
        })
    }
    
    private func createSchedulesTable(_ db: Connection) throws {
        let userTable = Table("schedules")
        let id = Expression<Int64>("id")
        let status = Expression<String>("status")
        let technology_name = Expression<String>("technology_name")
        let sorting = Expression<Int64>("sorting")
        
        let code = Expression<String>("code")
        let publish = Expression<Bool>("publish")
        let sub_technology_name = Expression<String>("sub_technology_name")
        let right_description = Expression<String>("right_description")
        let left_description = Expression<String>("left_description")
        let program = Expression<String>("program")
        let registration = Expression<Bool>("registration")
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
        
        //TODO: слздать поле посещал не посещал
        try db.run(userTable.create { t in
            t.column(id, primaryKey: true)
            t.column(status, defaultValue: "")
            t.column(technology_name, defaultValue: "")
            t.column(sorting, defaultValue: 0)
            
            t.column(code, defaultValue: "")
            t.column(publish, defaultValue: false)
            t.column(sub_technology_name, defaultValue: "")
            t.column(right_description, defaultValue: "")
            t.column(left_description, defaultValue: "")
            t.column(program, defaultValue: "")
            t.column(registration, defaultValue: false)
            t.column(weekly_for_header_detail, defaultValue: "")
            t.column(is_finished, defaultValue: true)
            t.column(userName, defaultValue: "")
            t.column(position, defaultValue: "")
            t.column(monday, defaultValue: "")
            t.column(tuesday, defaultValue: "")
            t.column(wednesday, defaultValue: "")
            t.column(thursday, defaultValue: "")
            t.column(friday, defaultValue: "")
            t.column(saturday, defaultValue: "")
            t.column(sunday, defaultValue: "")
            
        })
    }
    
    private func createGroupsTable(_ db: Connection) throws {
        let groupsTable = Table("groups")
        let id = Expression<Int64>("id")
        let status = Expression<String>("status")
        let title = Expression<String>("title")
        let sorting = Expression<Int64>("sorting")
        let full_title = Expression<String>("full_title")
        let left_side = Expression<String>("left_side")
        let right_side = Expression<String>("right_side")
        let weekly_table = Expression<String>("weekly_table")
        let userName = Expression<String>("userName")
        let position = Expression<String>("position")
        let code = Expression<String>("code")
       
        
        //TODO: слздать поле посещал не посещал
        try db.run(groupsTable.create { t in
            t.column(id, primaryKey: true)
            t.column(status, defaultValue: "")
            t.column(title, defaultValue: "")
            t.column(sorting, defaultValue: 0)
            t.column(full_title, defaultValue: "")
            t.column(left_side, defaultValue: "")
            t.column(right_side, defaultValue: "")
            t.column(weekly_table, defaultValue: "")
            t.column(userName, defaultValue: "")
            t.column(position, defaultValue: "")
            t.column(code, defaultValue: "")
            
        })
    }
    
    private func createExamPrepareTable(_ db: Connection) throws {
        let examTable = Table("examPrepare")
        let id = Expression<Int64>("id")
        let status = Expression<String>("status")
        let title = Expression<String>("title")
        let sub_title = Expression<String>("sub_title")
        
        let sub_status = Expression<String>("sub_status")
        let left_description = Expression<String>("left_description")
        let right_description = Expression<String>("right_description")
        let about_course = Expression<String>("about_course")
        let program = Expression<String>("program")
        let registration = Expression<Bool>("registration")
        let userName = Expression<String>("userName")
        let position = Expression<String>("position")

        try db.run(examTable.create { t in
            t.column(id, primaryKey: true)
            t.column(status, defaultValue: "")
            t.column(title, defaultValue: "")
            t.column(sub_title, defaultValue: "")
            
            t.column(sub_status, defaultValue: "")
            t.column(left_description, defaultValue: "")
            t.column(right_description, defaultValue: "")
            t.column(about_course, defaultValue: "")
            t.column(program, defaultValue: "")
            t.column(registration, defaultValue: false)
            t.column(userName, defaultValue: "")
            t.column(position, defaultValue: "")

            
        })
    }
    
    private func createDirectionsTable(_ db: Connection) throws {
           let directionTable = Table("directions")
        let id = Expression<Int64>("id")
        let technology_id = Expression<Int>("technology_id")
        let teacher_id = Expression<Int>("teacher_id")
        let program = Expression<String>("program")
        let date_start = Expression<String>("date_start")
        let date_completion = Expression<String>("date_completion")
        let date_last_lesson = Expression<String>("date_last_lesson")
        let quantity_lesson = Expression<Int>("quantity_lesson")
        let date_create = Expression<String>("date_create")
        let date_update = Expression<String>("date_update")
        let update_by = Expression<Int>("update_by")
        let status = Expression<String>("status")
        let code = Expression<String>("code")
        let publish = Expression<String>("publish")
        let sorting = Expression<Int>("sorting")
        let responsible_id = Expression<Int>("responsible_id")
        let registration = Expression<Bool>("registration")
        let technology_title = Expression<String>("technology_title")
        let technology_sub_title = Expression<String>("technology_sub_title")
        let status_label = Expression<String>("status_label")
        let right_description = Expression<String>("right_description")
        let left_description = Expression<String>("left_description")
        let userName = Expression<String>("userName")
        let position = Expression<String>("position")
           
           //TODO: слздать поле посещал не посещал
        try db.run(directionTable.create { t in
            t.column(id, primaryKey: true)
            t.column(technology_id, defaultValue: 0)
            t.column(teacher_id, defaultValue: 0)
            
            t.column(program, defaultValue: "")
            t.column(date_start, defaultValue: "")
            t.column(date_completion, defaultValue: "")
            t.column(date_last_lesson, defaultValue: "")
            t.column(quantity_lesson, defaultValue: 0)
            t.column(date_create, defaultValue: "")
            t.column(date_update, defaultValue: "")
            t.column(status, defaultValue: "")
            t.column(code, defaultValue: "")
            t.column(publish, defaultValue: "")
            t.column(sorting, defaultValue: 0)
            t.column(responsible_id, defaultValue: 0)
            t.column(registration, defaultValue: false)
            t.column(technology_title, defaultValue: "")
            t.column(technology_sub_title, defaultValue: "")
            t.column(status_label, defaultValue: "")
            t.column(right_description, defaultValue: "")
            t.column(left_description, defaultValue: "")
            t.column(userName, defaultValue: "")
            t.column(position, defaultValue: "")
               
           })
       }
    
    
}
