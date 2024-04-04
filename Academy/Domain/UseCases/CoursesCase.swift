//
//  CoursesCase.swift
//  Academy
//
//  Created by MovchanArtemiy on 13.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class GetCoursesListCase: UseCase<[CoursesList]> {

    override init() {}
    
    
    //есть 3 массива с данными для таблиц. нужно сделать создание таблиц.
    override func execute() -> Response<[CoursesList]> {
        let authResponse: Response<CoursesResponse> = AcademyRepository.response(apiService: .coursesList(publish: true))
        
        //список курсов(не таблица)
        var coursesList: [CoursesList] = []
        
        //таблицы
        var schedulesArray: [Schedules] = []
        var groupsArray: [Groups] = []
        var examsArray: [Exam_preparation] = []
        var directionsArray: [Directions] = []
        
        let schedules = authResponse.result?.schedules
        let groups = authResponse.result?.groups
        var exam_preparation = authResponse.result?.exam_preparation
    
        
        for courses in schedules! {
            var course = CoursesList()
            course.id = courses.id
            course.nameCourse = courses.technology_name
            course.status = courses.status
            course.rightDescription = courses.right_description.replacingOccurrences(of: "<ul><li>", with: "")
            //course.rightDescription = "<div style='font-family: Roboto-Light;font-size:16px;'>\(courses.right_description)</div>".htmlToAttributedString
            course.registration = courses.registration
            course.tableName = "schedules"
            coursesList.append(course)
            
        }

        
        
        for groups in groups! {
            var course = CoursesList()
            course.id = groups.id
            course.nameCourse = groups.title
            course.status = groups.status
//            course.left_description = groups.left_side
            course.rightDescription = groups.right_side.replacingOccurrences(of: "<h2>Оценка</h2><ul><li>", with: "")
            course.tableName = "groups"
            coursesList.append(course)
        }

            var course = CoursesList()
        course.id = exam_preparation!.id
        course.nameCourse = exam_preparation!.title
        course.status = exam_preparation!.status
//        course.left_description = exam_preparation?.left_description ?? ""
        course.rightDescription = exam_preparation?.right_description.replacingOccurrences(of: "<ul><li>", with: "") ?? ""
//        course.program = exam_preparation?.program ?? ""
        course.registration = exam_preparation!.registration
        course.tableName = "exam_preparation"
        coursesList.append(course)

        
        
        
   
       
        for scheduleJson in schedules! {
             var scheduleBase = Schedules()
            scheduleBase.id = scheduleJson.id
            scheduleBase.status = scheduleJson.status
            //scheduleBase.sorting = scheduleJson.sorting
            scheduleBase.technology_name = scheduleJson.technology_name
            scheduleBase.right_description = scheduleJson.right_description
            scheduleBase.left_description = scheduleJson.left_description
            scheduleBase.program = scheduleJson.program
            
            //scheduleBase.responsible?.username = scheduleJson.responsible.username
            scheduleBase.userName = scheduleJson.responsible.username
            scheduleBase.position = scheduleJson.responsible.position
            
            scheduleBase.code = scheduleJson.code
//            scheduleBase.publish = scheduleJson.publish
//            scheduleBase.sub_technology_name = scheduleJson.sub_technology_name
            
//            if scheduleJson.registration != true {
//              scheduleBase.registration = true
//            }
            
            scheduleBase.registration = scheduleJson.registration
            //scheduleBase.responsible = scheduleJson.responsible
            //scheduleBase.weekly = scheduleJson.weekly
            scheduleBase.weekly_for_header_detail = scheduleJson.weekly_for_header_detail
//            scheduleBase.is_finished = scheduleJson.is_finished
            
            scheduleBase.monday = scheduleJson.weekly.monday
            scheduleBase.tuesday = scheduleJson.weekly.tuesday
            scheduleBase.wednesday = scheduleJson.weekly.wednesday
            scheduleBase.thursday = scheduleJson.weekly.thursday
            scheduleBase.friday = scheduleJson.weekly.friday
            scheduleBase.saturday = scheduleJson.weekly.saturday
            scheduleBase.sunday = scheduleJson.weekly.sunday
        
            schedulesArray.append(scheduleBase)
            

        }
    
        
        for groupJson in groups! {
            var groupBase = Groups()
            //var scheduleBase = Schedules()
            groupBase.id = groupJson.id
            groupBase.title = groupJson.title
            groupBase.full_title = groupJson.full_title
            groupBase.code = groupJson.code
            groupBase.status = groupJson.status
            groupBase.sorting = groupJson.sorting
            groupBase.left_side = groupJson.left_side
            groupBase.right_side = groupJson.right_side
            
            for scheduleInGroups in groupJson.schedules {
                var directionBase = Directions()
                directionBase.id = scheduleInGroups.id
                
                directionBase.technology_id = scheduleInGroups.technology_id
                directionBase.teacher_id = scheduleInGroups.teacher_id
                directionBase.program = scheduleInGroups.program
                directionBase.date_start = scheduleInGroups.date_start
                directionBase.date_completion = scheduleInGroups.date_completion
                directionBase.date_last_lesson = scheduleInGroups.date_last_lesson
                directionBase.quantity_lesson = scheduleInGroups.quantity_lesson
                directionBase.date_create = scheduleInGroups.date_create
                directionBase.date_update = scheduleInGroups.date_update
                //directionBase.update_by = scheduleInGroups.update_by
                directionBase.status = scheduleInGroups.status
                directionBase.code = scheduleInGroups.code
                directionBase.publish = scheduleInGroups.publish
                directionBase.sorting = scheduleInGroups.sorting
                directionBase.responsible_id = scheduleInGroups.responsible_id
                directionBase.registration = scheduleInGroups.registration
                directionBase.technology_title = scheduleInGroups.technology_title
                directionBase.technology_sub_title = scheduleInGroups.technology_sub_title
                directionBase.tableName = "directions"
                
                directionBase.status_label = "Курс в проработке"
                directionBase.right_description = scheduleInGroups.right_description
                directionBase.left_description = scheduleInGroups.left_description
                //directionBase.userName = scheduleInGroups.responsible.username
                //directionBase.position = scheduleInGroups.responsible.position
                //print(scheduleInGroups.status_label)
                //directionBase.status_label = scheduleInGroups.status
                //print("test \(scheduleInGroups.status_label)")
                //directionBase.status_label = scheduleInGroups.status_label
                
                directionsArray.append(directionBase)
              
            }
            
            
            groupBase.weekly_table = groupJson.weekly_table
            groupBase.userName = groupJson.responsible.username
            groupBase.position = groupJson.responsible.position
            groupsArray.append(groupBase)
        }
        
        
    
        
        let examPrepare = Exam_preparation()
        examPrepare.id = exam_preparation!.id 
        examPrepare.title = exam_preparation?.title ?? ""
        examPrepare.sub_title = exam_preparation?.sub_title ?? ""
        examPrepare.status = exam_preparation?.status ?? ""
        examPrepare.sub_status = exam_preparation?.sub_status ?? ""
        examPrepare.left_description = exam_preparation?.left_description ?? ""
        examPrepare.right_description = exam_preparation?.right_description ?? ""
        examPrepare.about_course = exam_preparation?.about_course ?? ""
        examPrepare.program = exam_preparation?.program ?? ""
        examPrepare.userName = exam_preparation?.responsible.username ?? ""
        examPrepare.position = exam_preparation?.responsible.position ?? ""
        examPrepare.registration = exam_preparation?.registration ?? false
        examsArray.append(examPrepare)

        
        if !coursesList.isEmpty {
            DBRepository.schedulesTable().deleteAndInsertAll(schedulesArray)
            DBRepository.groupsTable().deleteAndInsertAll(groupsArray)
            DBRepository.examPrepareTable().deleteAndInsertAll(examsArray)
            DBRepository.directionsTable().deleteAndInsertAll(directionsArray)
        }
        return Response.init(coursesList, authResponse.error, authResponse.statusCode)
    }
}

class GetScheduleCase: UseCase<[Schedules]> {

    override init() {}
    
    override func execute() -> Response<[Schedules]> {
        let authResponse: Response<CoursesResponse> = AcademyRepository.response(apiService: .coursesList(publish: true))
        
        var schedules: [Schedules] = []
        if let arrRes = authResponse.result?.schedules {
            for item in arrRes {
                let schedule = item.toDb()
                schedules.append(schedule)
            }
        }
        if !schedules.isEmpty {
            DBRepository.schedulesTable().deleteAndInsertAll(schedules)
        }


        
        return Response.init(schedules, authResponse.error, authResponse.statusCode)
    }
}





class GetGroupsCase: UseCase<[Groups]> {

    override init() {}

    override func execute() -> Response<[Groups]> {
        let authResponse: Response<CoursesResponse> = AcademyRepository.response(apiService: .coursesList(publish: true))

        var groups: [Groups] = []
        if let arrRes = authResponse.result?.groups {
            for item in arrRes {
                let group = item.toDb()
                groups.append(group)
            }
        }
        
        if !groups.isEmpty {
            DBRepository.groupsTable().deleteAndInsertAll(groups)
        }

        return Response.init(groups, authResponse.error, authResponse.statusCode)
    }
}


class GetExamPreparationCase: UseCase<Exam_preparation> {

    override init() {}

    override func execute() -> Response<Exam_preparation> {
        let authResponse: Response<CoursesResponse> = AcademyRepository.response(apiService: .coursesList(publish: true))

        let exam = Exam_preparation()
//        if let arrRes = authResponse.result?.exam_preparation {
//            for item in arrRes {
//                let group = item.toDb()
//                groups.append(group)
//            }
//        }

        let arrRes = authResponse.result?.exam_preparation
        //let group = item.toDb()
        exam.id = arrRes?.id ?? 0
        exam.title = arrRes?.title ?? ""
        exam.status = arrRes?.status ?? ""


        return Response.init(exam, authResponse.error, authResponse.statusCode)
    }
}


extension CoursesDictionary {
    func toDb() -> Schedules {
        let id: Int = Int(Calendar.current.date(byAdding: .day, value: 1, to: Date())!.timeIntervalSince1970) + Int.random(in: 0 ..< 10)
        let schedule = Schedules()
        schedule.id = id
        schedule.technology_name = self.technology_name
        schedule.status = self.status
        
        return schedule
    }
}



extension GroupsDictionary {
    func toDb() -> Groups {
        let id: Int = Int(Calendar.current.date(byAdding: .day, value: 1, to: Date())!.timeIntervalSince1970) + Int.random(in: 0 ..< 10)
        let group = Groups()
        group.id = id
        group.title  = self.title
        group.status = self.status
        group.sorting = self.sorting
        
        return group
    }
}

extension Exam_preparation {
    func toDb() -> Exam_preparation {
        let id: Int = Int(Calendar.current.date(byAdding: .day, value: 1, to: Date())!.timeIntervalSince1970) + Int.random(in: 0 ..< 10)
        let exam = Exam_preparation()
        exam.id = id
        exam.title = title
        exam.status = status
    
        return exam
    }
}


