//
//  CheckTokenCase.swift
//  Academy
//
//  Created by Sergey Dimitriev on 15.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class CheckTokenCase: UseCase<DataModel<CheckUserData>> {
    var token: String

    init(_ token: String) {
        self.token = token
    }
    
    override func execute() -> Response<DataModel<CheckUserData>> {
        let authResponse: Response<DataModel<CheckUserData>> = AcademyRepository.response(apiService: .checkToken(token: token))
        return authResponse
    }
}
