//
//  NewsDao\.swift
//  portal
//
//  Created by Василий Сомов on 04/06/2019.
//  Copyright © 2019 Василий Сомов. All rights reserved.
//

import Foundation
import SQLite

class FaqDao: BaseDao {
    
    func getAllFaqList() -> [Faq] {
        let faqColumns = FaqDao.getColumns()
        if let query = try? dbConnection?.prepare(FaqDao.getTable().order(faqColumns.sorting.desc)) {
            return getFaqList(query)
        }
        return []
    }
    
    func deleteAll() {
        _ = try? dbConnection?.run(FaqDao.getTable().delete())
    }
    
    //@Transaction
    func deleteAndInsertAll(_ newss: [Faq]) {
        try? dbConnection?.transaction {
            deleteAll()
            insertNewsList(newss)
        }
    }
    
    //@Insert(onConflict = OnConflictStrategy.REPLACE)
    private func insertNewsList(_ newss: [Faq]) {
        let faqColumns = FaqDao.getColumns()
        let newsTable = FaqDao.getTable()
        for news in newss {
            let insertQuery = newsTable.insert(or: OnConflict.replace,
                                                  faqColumns.id <- news.id,
                                                  faqColumns.question <- news.question,
                                                  faqColumns.answer <- news.answer,
                                                  faqColumns.sorting <- news.sorting)
            let _ = try? dbConnection?.run(insertQuery)
        }
    }
    
    private func getFaqList(_ rows: AnySequence<Row>? ) -> [Faq] {
        var faqList: [Faq] = []
        guard let rows = rows else {
            return faqList
        }
        
        let faqColumns = FaqDao.getColumns()
        var faq: Faq
        for row in rows {
            faq = Faq()
            faq.id = row[faqColumns.id]
            faq.question = row[faqColumns.question]
            faq.answer = row[faqColumns.answer]
            faq.sorting = row[faqColumns.sorting]
            faqList.append(faq)
        }
        return faqList
    }
    
    static func getTable() -> Table {
        return Table(faqTableName)
    }
    
    static func getColumns() -> faqColumns {
        return faqColumns()
    }
    
    struct faqColumns {
        let newsTable = Table("faq")
        let id = Expression<Int>("id")
        let question = Expression<String>("question")
        let answer = Expression<String>("answer")
        let sorting = Expression<Int>("sorting")
    }
}
