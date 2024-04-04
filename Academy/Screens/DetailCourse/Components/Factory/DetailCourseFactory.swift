//
//  FactoryDetailCourse.swift
//  Academy
//
//  Created by MovchanArtemiy on 21.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

final class DetailCourseFactory {
    
    func buildDescription(text: String, id: Int, status: Bool) -> [CellModel] {
        var models = [CellModel]()
        let dataBase = DBRepository.schedulesTable().findCourseById(id: id)
        var groups = DBRepository.groupsTable().findCourseById(id: id)
        var exams = DBRepository.examPrepareTable().findExamById(id: id)
        var directions = DBRepository.directionsTable().findDirectionById(id: id)
        
        func buildHeadersCell() {
            models.append(buildWebHeader(text: "ДЛЯ КОГО", id: id, status: false))
            models.append(buildWebHeader(text: "ЧТО ДАЕТ КУРС", id: id, status: false))
        }
        
        func buildHeadersGroupsCell() {
            models.append(buildWebHeader(text: "КАК ПОПАСТЬ", id: id, status: false))
            models.append(buildWebHeader(text: "ОЦЕНКА", id: id, status: false))
        }
        
        func buildDirections() {
            var directions = DBRepository.directionsTable().getAllDirectionsList()
            for n in directions {
                 models.append(CoursesListModel(reuseIdentifier: "CoursesCell", nameCourse: n.technology_title, statusCourse: n.status_label, tableName: "directiontablename", registration: false, rightDescription: "", isExpanded: false, id: n.id))
             }
        }
        
        func buildImageCell() {
            //Занятия проходят \(dataBase?.weekly_for_header_detail)
            models.append(ImageCellModel(reuseIdentifier: "ImageCell", headText: dataBase?.technology_name ?? exams?.title ?? directions!.technology_title, descriptionText: dataBase?.status ?? exams?.status ?? directions!.status_label, weeklyDetail: "" , registration: dataBase?.registration ?? false))
           }
        
        func buildGroupsCell() {
           models.append(ImageCellModel(reuseIdentifier: "ImageCell", headText: groups!.title, descriptionText: groups!.status, weeklyDetail: "", registration: false))
        }
        
        func cellsSchedule() {
            models.append(SignUpCellModel(reuseIdentifier: "signUpCell", headName: dataBase?.userName ?? exams?.userName ?? directions!.userName, position: dataBase?.position ?? exams?.position ?? directions!.position))
            models.append(RegistrationCellModel(reuseIdentifier: "registrationCell", registration: dataBase?.registration ?? exams?.registration ?? directions!.registration))
        }
        
        func cellsGroups() {
            models.append(SignUpCellModel(reuseIdentifier: "signUpCell", headName: groups!.userName, position: groups!.position))
        }
        
    
        switch text {
        case "ДЛЯ КОГО":
            if status == false {
                buildImageCell()
                buildHeadersCell()
                if dataBase?.left_description == nil && directions?.left_description == nil {
                    models.append(buildWebHeader(text: "О КУРСЕ", id: id, status: false))
                }
                models.append(buildWebHeader(text: "ПРОГРАММА", id: id, status: false))
                cellsSchedule()
            } else {
                buildImageCell()
                models.append(buildWebHeader(text: "ДЛЯ КОГО", id: id, status: false))
                models.append(buildWebAnswer(answer: dataBase?.left_description ?? exams?.left_description ?? directions!.left_description))
                models.append(buildWebHeader(text: "ЧТО ДАЕТ КУРС", id: id, status: false))
                if dataBase?.left_description == nil && directions?.left_description == nil {
                    models.append(buildWebHeader(text: "О КУРСЕ", id: id, status: false))
                }
                models.append(buildWebHeader(text: "ПРОГРАММА", id: id, status: false))
                cellsSchedule()
            }
            
        case "ЧТО ДАЕТ КУРС":
            if status == false {
                buildImageCell()
                buildHeadersCell()
                if dataBase?.left_description == nil && directions?.left_description == nil {
                                 models.append(buildWebHeader(text: "О КУРСЕ", id: id, status: false))
                }
                models.append(buildWebHeader(text: "ПРОГРАММА", id: id, status: false))
                cellsSchedule()
            } else {
                buildImageCell()
                models.append(buildWebHeader(text: "ДЛЯ КОГО", id: id, status: false))
                models.append(buildWebHeader(text: "ЧТО ДАЕТ КУРС", id: id, status: false))
                models.append(buildWebAnswer(answer: dataBase?.right_description ?? exams?.right_description ?? directions!.right_description))
                if dataBase?.left_description == nil && directions?.left_description == nil{
                                 models.append(buildWebHeader(text: "О КУРСЕ", id: id, status: false))
                }
                models.append(buildWebHeader(text: "ПРОГРАММА", id: id, status: false))
                cellsSchedule()
            }
        case "О КУРСЕ":
            if status == false {
                buildImageCell()
                buildHeadersCell()
                   if dataBase?.left_description == nil && directions?.left_description == nil{
                                 models.append(buildWebHeader(text: "О КУРСЕ", id: id, status: false))
                }
                models.append(buildWebHeader(text: "ПРОГРАММА", id: id, status: false))
                cellsSchedule()
            } else {
                buildImageCell()
                models.append(buildWebHeader(text: "ДЛЯ КОГО", id: id, status: false))
                models.append(buildWebHeader(text: "ЧТО ДАЕТ КУРС", id: id, status: false))
                   if dataBase?.left_description == nil && directions?.left_description == nil {
                                 models.append(buildWebHeader(text: "О КУРСЕ", id: id, status: false))
                }
                models.append(buildWebAnswer(answer: exams!.about_course))
                models.append(buildWebHeader(text: "ПРОГРАММА", id: id, status: false))
                cellsSchedule()
            }
            
        case "ПРОГРАММА":
            if status == false {
                buildImageCell()
                buildHeadersCell()
                if dataBase?.left_description == nil && directions?.left_description == nil {
                                 models.append(buildWebHeader(text: "О КУРСЕ", id: id, status: false))
                }

                models.append(buildWebHeader(text: "ПРОГРАММА", id: id, status: false))
                cellsSchedule()
            } else {
                buildImageCell()
                buildHeadersCell()
                if dataBase?.left_description == nil && directions?.left_description == nil {
                                 models.append(buildWebHeader(text: "О КУРСЕ", id: id, status: false))
                }
                models.append(buildWebHeader(text: "ПРОГРАММА", id: id, status: false))
                models.append(buildWebAnswer(answer: dataBase?.program ?? exams?.program ?? directions!.program))
                cellsSchedule()
            }
        case "КАК ПОПАСТЬ":
            if status == false {
                buildGroupsCell()
                buildHeadersGroupsCell()
                buildDirections()
                models.append(buildWebHeader(text: "РАСПИСАНИЕ", id: id, status: false))
                cellsGroups()
            } else {
                buildGroupsCell()
                models.append(buildWebHeader(text: "КАК ПОПАСТЬ", id: id, status: false))
                models.append(buildWebAnswer(answer: groups!.left_side))
                models.append(buildWebHeader(text: "ОЦЕНКА", id: id, status: false))
                buildDirections()
                models.append(buildWebHeader(text: "РАСПИСАНИЕ", id: id, status: false))
                cellsGroups()
            }
        case "ОЦЕНКА":
            if status == false {
                buildGroupsCell()
                buildHeadersGroupsCell()
                buildDirections()
                models.append(buildWebHeader(text: "РАСПИСАНИЕ", id: id, status: false))
                cellsGroups()
            } else {
                buildGroupsCell()
                buildHeadersGroupsCell()
                models.append(buildWebAnswer(answer: groups!.right_side))
                buildDirections()
                models.append(buildWebHeader(text: "РАСПИСАНИЕ", id: id, status: false))
                cellsGroups()
            }
        case "РАСПИСАНИЕ":
            if status == false {
                buildGroupsCell()
                buildHeadersGroupsCell()
                buildDirections()
                models.append(buildWebHeader(text: "РАСПИСАНИЕ", id: id, status: false))
                cellsGroups()
            } else {
                buildGroupsCell()
                buildHeadersGroupsCell()
                models.append(buildWebAnswer(answer: groups!.right_side))
                buildDirections()
                models.append(buildWebHeader(text: "РАСПИСАНИЕ", id: id, status: false))
                models.append(buildWebAnswer(answer: groups!.weekly_table))
                cellsGroups()
            }
            
            
        default:
            break
        }

        return models
        
    }

    private func buildWebHeader(text: String, id: Int, status: Bool) -> CellModel {
        return WebHeaderCellModel(textHeader: text, id: id, codeType: status ? .arrowUp : .arrowDown)
    }
    
    private func buildWebAnswer(answer: String) -> CellModel {
        
        return WebAnswerCellModel(textHeader: answer)
    }
    
    func buildSchedule( id: Int, status: Bool) -> [CellModel] {
        var models = [CellModel]()
        
        let dataBase = DBRepository.schedulesTable().findCourseById(id: id)
        
        models.append(ImageCellModel(reuseIdentifier: "ImageCell", headText: dataBase!.technology_name, descriptionText: dataBase!.status, weeklyDetail: "Занятия проходят \(dataBase!.weekly_for_header_detail)", registration: dataBase!.registration))
         models.append(buildWebHeader(text: "ДЛЯ КОГО", id: id, status: false))
         models.append(buildWebHeader(text: "ЧТО ДАЕТ КУРС", id: id, status: false))
         models.append(buildWebHeader(text: "ПРОГРАММА", id: id, status: false))

        //models.append(TextCellModel(reuseIdentifier: "TextCell", headText: "Информация", descriptionText: "Участие бесплатное", descriptionRegistration: "Требуется предварительная регистрация", descriptionCertificate: "По окончании курса будут выданы сертификаты", isExpanded: false))
        models.append(SignUpCellModel(reuseIdentifier: "signUpCell", headName: dataBase!.userName, position: dataBase!.position))
        models.append(RegistrationCellModel(reuseIdentifier: "registrationCell", registration: dataBase!.registration))
        
        
        return models
    }
    
    func buildGroup( id: Int) -> [CellModel] {
        var models = [CellModel]()
        var dataBase = DBRepository.groupsTable().findCourseById(id: id)
        var directions = DBRepository.directionsTable().getAllDirectionsList()
        var directId = DBRepository.directionsTable().findDirectionById(id: id)
        
        
        models.append(ImageCellModel(reuseIdentifier: "ImageCell", headText: dataBase!.title, descriptionText: dataBase!.status, weeklyDetail: "", registration: false))
        models.append(buildWebHeader(text: "КАК ПОПАСТЬ", id: id, status: false))
        models.append(buildWebHeader(text: "ОЦЕНКА", id: id, status: false))
        
        models.append(TableCoursesCellModel(reuseIdentifier: "tableCoursesCell"))
        
        for n in directions {
            models.append(CoursesListModel(reuseIdentifier: "CoursesCell", nameCourse: n.technology_title, statusCourse: n.status_label, tableName: "directiontablename", registration: false, rightDescription: "", isExpanded: false, id: n.id))
        }
        models.append(buildWebHeader(text: "РАСПИСАНИЕ", id: id, status: false))
//        models.append(WebViewCellModel(reuseIdentifier: "WebViewCell", headText: "РАСПИСАНИЕ", webView: dataBase!.weekly_table, isExpanded: false))

        models.append(SignUpCellModel(reuseIdentifier: "signUpCell", headName: dataBase!.userName, position: dataBase!.position))
        
        
        return models
    }
    
    
    func buildDirections(id: Int) -> [CellModel] {
        var models = [CellModel]()
        var dataBase = DBRepository.directionsTable().findDirectionById(id: id)

        models.append(ImageCellModel(reuseIdentifier: "ImageCell", headText: dataBase!.technology_title, descriptionText: dataBase!.status_label, weeklyDetail: "", registration: dataBase!.registration))
        models.append(buildWebHeader(text: "ДЛЯ КОГО", id: id, status: false))
        models.append(buildWebHeader(text: "ЧТО ДАЕТ КУРС", id: id, status: false))
        models.append(buildWebHeader(text: "ПРОГРАММА", id: id, status: false))
        models.append(SignUpCellModel(reuseIdentifier: "signUpCell", headName: dataBase!.userName, position: dataBase!.position))
        //models.append(TextCellModel(reuseIdentifier: "TextCell", headText: "Информация", descriptionText: "Участие бесплатное", descriptionRegistration: "Требуется предварительная регистрация", descriptionCertificate: "По окончании курса будут выданы сертификаты", isExpanded: false))
        //models.append(SignUpCellModel(reuseIdentifier: "signUpCell", headName: dataBase!.userName, position: dataBase!.position))
        //models.append(RegistrationCellModel(reuseIdentifier: "registrationCell", registration: dataBase!.registration))
        
        return models
        
    }
    
    func buildExam( id: Int) -> [CellModel] {
        var models = [CellModel]()
        var dataBase = DBRepository.examPrepareTable().findExamById(id: id)
        
        models.append(ImageCellModel(reuseIdentifier: "ImageCell", headText: dataBase!.title, descriptionText: dataBase!.status, weeklyDetail: "", registration: false))
        models.append(buildWebHeader(text: "ДЛЯ КОГО", id: id, status: false))
        models.append(buildWebHeader(text: "ЧТО ДАЕТ КУРС", id: id, status: false))
        models.append(buildWebHeader(text: "О КУРСЕ", id: id, status: false))
        models.append(buildWebHeader(text: "ПРОГРАММА", id: id, status: false))
        models.append(SignUpCellModel(reuseIdentifier: "signUpCell", headName: dataBase!.userName, position: dataBase!.position))
        models.append(RegistrationCellModel(reuseIdentifier: "registrationCell", registration: dataBase!.registration))
        
        return models
    }
     
}
