//
//  FaqResponse.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

struct FaqData: Codable {
    var questions: [FaqItemData]
    
    private enum CodingKeys: String, CodingKey {
        case questions
    }
}

struct FaqItemData: Codable {
    var question: String?
    var answer: String?
    var sorting: Int?
    
    private enum CodingKeys: String, CodingKey {
        case question
        case answer
        case sorting
    }
}
