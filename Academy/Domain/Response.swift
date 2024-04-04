//
//  Response.swift
//  Academy
//
//  Created by MovchanArtemiy on 13.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class Response<T> {
    var statusCode: Int
    var result: T?
    var error: UseCaseMessage
    
    init() {
        self.statusCode = 0
        self.result = nil
        self.error = ERROR_EMPTY
    }
    
    init(_ data: T?, _ error: UseCaseMessage, _ status: Int) {
        self.result = data
        self.error = error
        self.statusCode = status
    }
}


class UseCaseMessage: Error {
    var message: String?
    init(_ message: String?) {
        self.message = message
    }
}

class RequestError: UseCaseMessage {
    var code: Int
    init(_ code: Int, _ message: String?) {
        self.code = code
        super.init(message)
    }
}

class ResponseError: UseCaseMessage {
    var code: Int
    var errorBody: String?
    init(_ code: Int, _ message: String?, _ errorBody: String?) {
        self.code = code
        self.errorBody = errorBody
        super.init(message)
    }
}
