//
//  CheckUserCase.swift
//  Academy
//
//  Created by Sergey Dimitriev on 15.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class CheckUserCase: UseCase<CheckUserData> {
    var email: String

    init(_ email: String) {
        self.email = email
    }
    
    override func execute() -> Response<CheckUserData> {
        let authResponse: Response<CheckUserData> = AcademyRepository.response(apiService: .checkUser(email: email))
        return authResponse
    }
}
