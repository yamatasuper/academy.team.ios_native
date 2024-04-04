//
//  SigninPasswordCase.swift
//  Academy
//
//  Created by Sergey Dimitriev on 15.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class SigninPasswordCase: UseCase<String> {
    var email: String
    var password: String

    init(_ email: String, _ password: String) {
        self.email = email
        self.password = password
    }
    
    override func execute() -> Response<String> {
        let authResponse: Response<String> = AcademyRepository.response(apiService: .signin_password(email: email, password: password))
        return authResponse
    }
}
