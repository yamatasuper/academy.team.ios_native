//
//  Error.swift
//  Academy
//
//  Created by Sergey Dimitriev on 13.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import Moya

extension Error {
    func toUserError() -> UseCaseMessage {
        switch self {
        case is RequestError:
            let error = self as! RequestError
            switch error.code {
            case 401 :
//                Events.UnauthEvent.post()
                break
            default:
                break
            }
            return self as! RequestError
        default:
            return ERROR
        }
    }
}

func getErrorFromResponse(response: Moya.Response) -> UseCaseMessage? {
    if response.statusCode >= 300 {
        switch response.statusCode {
        case 401:
            return ERROR_AUTH
        default:
            return ERROR
        }
    }
    return nil
}
