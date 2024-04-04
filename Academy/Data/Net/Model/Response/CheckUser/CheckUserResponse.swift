//
//  CheckUserResponse.swift
//  Academy
//
//  Created by Sergey Dimitriev on 13.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

typealias Codable = Encodable & Decodable

struct CheckUserData: Codable {
    var message: String?
    var username: String?
    var social: String?
    
    private enum CodingKeys: String, CodingKey {
        case message
        case username
        case social
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        message = try? container.decode(String.self, forKey: .message)
        username = try? container.decode(String.self, forKey: .username)
        social = try? container.decode(String.self, forKey: .social)
    }
}
