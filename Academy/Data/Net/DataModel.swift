//
//  DataModel.swift
//  Academy
//
//  Created by MovchanArtemiy on 10.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

protocol DataProtokol: Codable {
    var status: String? {get set}
    var message: String? {get set}
}

struct DataModel<T: Codable>: DataProtokol {
    var status: String?
    var message: String?
    
    var data: T?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let value = try? container.decode(Int.self, forKey: .status) {
            status = String(value)
        } else {
            status = try container.decode(String.self, forKey: .status)
        }
        message = try? container.decode(String.self, forKey: .message)
        data = try? container.decode(T.self, forKey: .data)
    }
}


struct DataArrayModel<T: Codable>: DataProtokol {
    
    var status: String?
    var message: String?
    
    var data: [T]?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let value = try? container.decode(Int.self, forKey: .status) {
            status = String(value)
        } else {
            status = try container.decode(String.self, forKey: .status)
        }
        message = (try? container.decode(String.self, forKey: .message)) ?? nil
        data = (try? container.decode([T].self, forKey: .data)) ?? nil
    }
}
