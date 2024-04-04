//
//  ExamPrepareDao.swift
//  Academy
//
//  Created by MovchanArtemiy on 23.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import SQLite

class ExamPrepareDao: BaseDao {
    
    func getAllExamPrepareList() -> [Exam_preparation] {
        let examPrepareColumns = ExamPrepareDao.getColumns()
        if let query = try? dbConnection?.prepare(ExamPrepareDao.getTable().order(examPrepareColumns.id.desc)) {
            return getExamPrepareList(query)
        }
        return []
    }
    
    func deleteAll() {
        _ = try? dbConnection?.run(ExamPrepareDao.getTable().delete())
    }
    
    //@Transaction
    func deleteAndInsertAll(_ newss: [Exam_preparation]) {
        try? dbConnection?.transaction {
            deleteAll()
            insertNewsList(newss)
        }
    }
    
    //@Insert(onConflict = OnConflictStrategy.REPLACE)
    private func insertNewsList(_ newss: [Exam_preparation]) {
        let examPrepareColumns = ExamPrepareDao.getColumns()
        let newsTable = ExamPrepareDao.getTable()
        for news in newss {
            let insertQuery = newsTable.insert(or: OnConflict.replace,
                                               examPrepareColumns.id <- news.id,
                                               examPrepareColumns.title <- news.title,
                                               examPrepareColumns.status <- news.status,
                                               examPrepareColumns.sub_title <- news.sub_title,
                                               examPrepareColumns.sub_status <- news.sub_status,
                                               examPrepareColumns.left_description <- news.left_description,
                                               examPrepareColumns.right_description <- news.right_description,
                                               examPrepareColumns.about_course <- news.about_course,
                                               examPrepareColumns.program <- news.program,
                                               examPrepareColumns.registration <- news.registration,
                                               examPrepareColumns.userName <- news.userName,
                                               examPrepareColumns.position <- news.position)
            
            let _ = try? dbConnection?.run(insertQuery)
        }
    }
    
    private func getExamPrepareList(_ rows: AnySequence<Row>? ) -> [Exam_preparation] {
        var examPrepareList: [Exam_preparation] = []
        guard let rows = rows else {
            return examPrepareList
        }
        
        let examPrepareColumns = ExamPrepareDao.getColumns()
        var examPrepare: Exam_preparation
        for row in rows {
            examPrepare = Exam_preparation()
            examPrepare.id = row[examPrepareColumns.id]
            examPrepare.title = row[examPrepareColumns.title]
            examPrepare.sub_title = row[examPrepareColumns.sub_title]
            examPrepare.status = row[examPrepareColumns.status]
            examPrepare.sub_status = row[examPrepareColumns.sub_status]
            examPrepare.left_description = row[examPrepareColumns.left_description]
            examPrepare.right_description = row[examPrepareColumns.right_description]
            examPrepare.about_course = row[examPrepareColumns.about_course]
            examPrepare.program = row[examPrepareColumns.program]
            examPrepare.registration = row[examPrepareColumns.registration]
            examPrepare.userName = row[examPrepareColumns.userName]
            examPrepare.position = row[examPrepareColumns.position]
            
            examPrepareList.append(examPrepare)
        }
        return examPrepareList
    }
    
    //@Query("SELECT * FROM user WHERE id = :id")
    func findExamById(id: Int) -> Exam_preparation? {
        let examsColumns = ExamPrepareDao.getColumns()
        if let query = try? dbConnection?.prepare(ExamPrepareDao.getTable().where(examsColumns.id == id)) {
            let groups = getExamPrepareList(query)
            return groups.first
        }
        return nil
    }
    
    static func getTable() -> Table {
        return Table(examPrepareTableName)
    }
    
    static func getColumns() -> examPrepareColumns {
        return examPrepareColumns()
    }
    
    struct examPrepareColumns {
        let newsTable = Table("examPrepare")
        let id = Expression<Int>("id")
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
        
    }
}
