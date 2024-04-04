//
//  User.swift
//  portal
//
//  Created by Василий Сомов on 29.11.2018.
//  Copyright © 2018 Василий Сомов. All rights reserved.
//

import UIKit
import ObjectMapper


// Todo Разбить на файлы



class User {
    var id: Int64 = 0
    var email: String = ""
    var name: String = ""
    var password: String = ""
    var token: String = ""
    var social: String = ""
}

class Faq {
    var id: Int = 0
    var question: String = ""
    var answer: String = ""
    var sorting: Int = 0
}

class Schedules {
    var id: Int = 0
    var status: String = ""
    var code: String = ""
    var publish: Bool = false
    var sorting: Int = 0
    var technology_name: String = ""
    var sub_technology_name: String = ""
    var right_description: String = ""
    var left_description: String = ""
    var program: String = ""
    var registration: Bool = false
    var userName: String = ""
    var position: String = ""
    //var weekly: Weekly?
    var monday: String = ""
    var tuesday: String = ""
    var wednesday: String = ""
    var thursday: String = ""
    var friday: String = ""
    var saturday: String = ""
    var sunday: String = ""
    var weekly_for_header_detail: String = ""
//    var is_finished: Bool = false
    
}

class Groups {
    var id: Int = 0
    var title: String = ""
    var full_title: String = ""
    var code: String = ""
    var status: String = ""
    var sorting: Int = 0
    var left_side: String = ""
    var right_side: String = ""
    var schedules: [SchedulesDictionary] = []
    //weekly_table_mobile
    var weekly_table: String = ""
    var userName: String = ""
    var position: String = ""
    
    
}

class Exam_preparation {
    var id: Int = 0
    var title: String = ""
    var sub_title: String = ""
    var status: String = ""
    var sub_status: String = ""
    var left_description: String = ""
    var right_description: String = ""
    var about_course: String = ""
    var program: String = ""
    var registration: Bool = false
    var userName: String = ""
    var position: String = ""
    
}

class CoursesList {
    var id: Int = 0
    var tableName: String = ""
    var nameCourse: String = ""
    var rightDescription: String = ""
    var status: String = ""
    var registration: Bool = false
}

class Directions {
    var id: Int = 0
    var technology_id: Int = 0
    var teacher_id: Int = 0
    var program: String = ""
    var date_start = ""
    var date_completion: String = ""
    var date_last_lesson: String = ""
    var quantity_lesson: Int = 0
    var date_create: String = ""
    var date_update: String = ""
    //var update_by: Int = 0
    var status: String = ""
    var code: String = ""
    var publish: String = ""
    var sorting: Int = 0
    var responsible_id: Int = 0
    var registration: Bool = false
    var technology_title: String = ""
    var technology_sub_title: String = ""
    var status_label: String = ""
    var tableName: String = ""
    var right_description: String = ""
    var left_description: String = ""
    var userName: String = ""
    var position: String = ""
}

class PreRegistrationCoursesList {
    var code: String = ""
    
}


