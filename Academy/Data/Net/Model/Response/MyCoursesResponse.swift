//
//  MyCoursesResponse.swift
//  Academy
//
//  Created by Sergey Dimitriev on 27.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

struct MyCoursesList: Codable {
    var title: String?
    var date_start: String?
    var date_completion: String?
    var listened: Int?
    var completed: Int?
    var accepted: Int?
    var weekly: WeeklyList?
    var code: String?
    var status: String?
    
    private enum CodingKeys: String, CodingKey {
        case title
        case date_start
        case date_completion
        case listened
        case completed
        case accepted
        case weekly
        case code
        case status
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try? container.decode(String.self, forKey: .title)
        date_start = try? container.decode(String.self, forKey: .date_start)
        date_completion = try? container.decode(String.self, forKey: .date_completion)
        listened = try? container.decode(Int.self, forKey: .listened)
        completed = try? container.decode(Int.self, forKey: .completed)
        accepted = try? container.decode(Int.self, forKey: .accepted)
        weekly = try? container.decode(WeeklyList.self, forKey: .weekly)
        code = try? container.decode(String.self, forKey: .code)
        status = try? container.decode(String.self, forKey: .status)
    }
}

struct WeeklyList: Codable {
    var id: Int?
    var schedule_id: Int?
    var monday: String?
    var tuesday: String?
    var wednesday: String?
    var thursday: String?
    var friday: String?
    var saturday: String?
    var sunday: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case schedule_id
        case monday
        case tuesday
        case wednesday
        case thursday
        case friday
        case saturday
        case sunday
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try? container.decode(Int.self, forKey: .id)
        schedule_id = try? container.decode(Int.self, forKey: .schedule_id)
        monday = try? container.decode(String.self, forKey: .monday)
        tuesday = try? container.decode(String.self, forKey: .tuesday)
        wednesday = try? container.decode(String.self, forKey: .wednesday)
        thursday = try? container.decode(String.self, forKey: .thursday)
        friday = try? container.decode(String.self, forKey: .friday)
        saturday = try? container.decode(String.self, forKey: .saturday)
        sunday = try? container.decode(String.self, forKey: .sunday)
    }
}
