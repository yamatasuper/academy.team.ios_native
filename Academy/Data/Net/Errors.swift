//
//  Errors.swift
//  Academy
//
//  Created by MovchanArtemiy on 10.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

let ERROR_EMPTY = ResponseError(0, nil, nil)
let ERROR_CANCELATION = RequestError(0, nil)
let ERROR_INTERNET_NOT_FOUND = RequestError(800, "Отсутсвует интернет соединение")
let ERROR_TIMEOUT = RequestError(900, "Превышено время ожидания")
let ERROR = RequestError(1000, "Произошла ошибка")
let ERROR_SERVER = RequestError(300, "Ошибка сервера")
let ERROR_AUTH = RequestError(401, "Ошибка авторизации")
