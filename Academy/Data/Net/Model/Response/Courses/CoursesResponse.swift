//
//  CoursesResponse.swift
//  Academy
//
//  Created by MovchanArtemiy on 13.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

typealias CodableAbout = Encodable & Decodable

struct CoursesResponse: CodableAbout {
    var schedules: [CoursesDictionary]
    var groups: [GroupsDictionary]
    var exam_preparation: Preparation

    private enum CodingKeys: String, CodingKey {
        case schedules, groups,  exam_preparation
    }
}

struct Preparation: CodableAbout {
    var id: Int
    var title: String
    var sub_title: String
    var status: String
    var sub_status: String
    var right_description: String
    var left_description: String
    var about_course: String
    var program: String
    var registration: Bool
    var responsible: Responsible
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case sub_title
        case status
        case sub_status
        case right_description
        case left_description
        case about_course
        case program
        case registration
        case responsible
    }
    
}

struct Responsible: CodableAbout {
    var username: String
    var position: String
    //var image_full_path: Float

    private enum CodingKeys: String, CodingKey {
        case username, position
    }

}

struct Resp: CodableAbout {
    var username: String
    var position: String
    //var image_full_path: Float

    private enum CodingKeys: String, CodingKey {
        case username, position
    }

}

struct Weekly: CodableAbout {
    var id: Int
    var schedule_id: Int
    var monday: String
    var tuesday: String
    var wednesday: String
    var thursday: String
    var friday: String
    var saturday: String
    var sunday: String
    private enum CodingKeys: String, CodingKey {
          case id, schedule_id, monday, tuesday, wednesday, thursday, friday, saturday, sunday
      }
}

struct CoursesDictionary: Codable {
    var id: Int
    var status: String
    var code: String
    var publish: Bool
    var sorting: Int
    var technology_name: String
//    var sub_technology_name: String
    var right_description: String
    var left_description: String
    var program: String
    var registration: Bool
    var responsible: Responsible
    var weekly: Weekly
    var weekly_for_header_detail: String
//    var is_finished: Bool

    private enum CodingKeys: String, CodingKey {
        case id
        case status
        case code
        case publish
        case sorting
        case technology_name
//        case sub_technology_name
        case right_description
        case left_description
        case program
        case registration
        case responsible
        case weekly
        case weekly_for_header_detail
//        case is_finished

    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.status = try container.decodeIfPresent(String.self, forKey: .status) ?? ""
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.publish = try container.decodeIfPresent(Bool.self, forKey: .publish) ?? false
        self.sorting = try container.decodeIfPresent(Int.self, forKey: .sorting) ?? 0
        self.technology_name = try container.decodeIfPresent(String.self, forKey: .technology_name) ?? ""
//        self.sub_technology_name = try container.decodeIfPresent(String.self, forKey: .sub_technology_name) ?? ""
        self.right_description = try container.decodeIfPresent(String.self, forKey: .right_description) ?? ""
        self.left_description = try container.decodeIfPresent(String.self, forKey: .left_description) ?? ""
        self.program = try container.decodeIfPresent(String.self, forKey: .program) ?? ""
        self.registration = try container.decodeIfPresent(Bool.self, forKey: .registration) ?? false
        self.responsible = try container.decode(Responsible.self, forKey: .responsible)
        self.weekly = try container.decode(Weekly.self, forKey: .weekly)
        self.weekly_for_header_detail = try container.decodeIfPresent(String.self, forKey: .weekly_for_header_detail) ?? ""
//        self.is_finished = try container.decode(Bool.self, forKey: .is_finished)
    }
    
    
}

struct GroupsDictionary: Codable {
    var id: Int
    var title: String
    var full_title: String
    var code: String
    var status: String
    var sorting: Int
    var left_side: String
    var right_side: String
    var schedules: [SchedulesDictionary]
    //weekly_table_mobile
    var weekly_table: String
    var responsible: Responsible

    private enum CodingKeys: String, CodingKey {
    case id
    case title
    case full_title
    case code
    case status
    case sorting
    case left_side
    case right_side
    case schedules
    case weekly_table
    case responsible

    }
    
}
    struct SchedulesDictionary: Codable {
        var id: Int
        var technology_id: Int
        var teacher_id: Int
        var program: String
        var date_start: String
        var date_completion: String
        var date_last_lesson: String
        var quantity_lesson: Int
        var date_create: String
        var date_update: String
        var update_by: Int
        var status: String
        var code: String
        var publish: String
        var sorting: Int
        var responsible_id: Int
        var registration: Bool
        var technology_title: String
        var technology_sub_title: String
        //var status_label: String
        var right_description: String
        var left_description: String
        //var responsible: Resp

        
        private enum CodingKeys: String, CodingKey {
            case id
            case technology_id
            case teacher_id
            case program
            case date_start
            case date_completion
            case date_last_lesson
            case quantity_lesson
            case date_create
            case date_update
            case update_by
            case status
            case code
            case publish
            case sorting
            case responsible_id
            case registration
            case technology_title
            case technology_sub_title
            //case status_label
            case right_description
            case left_description
            //case responsible

          }
        
        init(from decoder: Decoder) throws {
             let container = try decoder.container(keyedBy: CodingKeys.self)
             self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
             self.technology_id = try container.decodeIfPresent(Int.self, forKey: .technology_id) ?? 0
             self.teacher_id = try container.decodeIfPresent(Int.self, forKey: .teacher_id) ?? 0
             self.program = try container.decodeIfPresent(String.self, forKey: .program) ?? ""
             self.date_start = try container.decodeIfPresent(String.self, forKey: .date_start) ?? ""
            self.date_completion = try container.decodeIfPresent(String.self, forKey: .date_completion) ?? ""
            self.date_last_lesson = try container.decodeIfPresent(String.self, forKey: .date_last_lesson) ?? ""
            self.quantity_lesson = try container.decodeIfPresent(Int.self, forKey: .quantity_lesson) ?? 0
            self.date_create = try container.decodeIfPresent(String.self, forKey: .date_create) ?? ""
            self.date_update = try container.decodeIfPresent(String.self, forKey: .date_update) ?? ""
            self.update_by = try container.decodeIfPresent(Int.self, forKey: .update_by) ?? 0
            self.status = try container.decodeIfPresent(String.self, forKey: .status) ?? ""
            self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
            self.publish = try container.decodeIfPresent(String.self, forKey: .publish) ?? ""
            self.sorting = try container.decodeIfPresent(Int.self, forKey: .sorting) ?? 0
            self.responsible_id = try container.decodeIfPresent(Int.self, forKey: .responsible_id) ?? 0
            self.registration = try container.decodeIfPresent(Bool.self, forKey: .registration) ?? false
            self.technology_title = try container.decodeIfPresent(String.self, forKey: .technology_title) ?? ""
            self.technology_sub_title = try container.decodeIfPresent(String.self, forKey: .technology_sub_title) ?? ""
            //self.status_label = try container.decodeIfPresent(String.self, forKey: .status_label) ?? "status"
            self.right_description = try container.decodeIfPresent(String.self, forKey: .right_description) ?? ""
            self.left_description = try container.decodeIfPresent(String.self, forKey: .left_description) ?? ""
            //self.responsible = try container.decode(Resp.self, forKey: .responsible)
         }
        
        
    }







extension KeyedDecodingContainer  {
func decodeUltimateNumber(key: Key) -> Double {
    if let value = try? self.decodeIfPresent(String.self, forKey: key), let price = Double(value) {
        return price
    } else if let value = try? self.decodeIfPresent(Int.self, forKey: key) {
        return Double(value)
    } else {
        return (try? self.decodeIfPresent(Double.self, forKey: key)) ?? 0.0
    }
}
}
