//
//  QuestionResultResponse.swift
//  Academy
//
//  Created by Sergey Dimitriev on 10.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//
import Foundation

struct QuestionResultResponse: Codable {
    var message: String?
    
    private enum CodingKeys: String, CodingKey {
        case message
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        message = try? container.decode(String.self, forKey: .message)
    }
}
