//
//  RegistrationUserCase.swift
//  Academy
//
//  Created by Sergey Dimitriev on 15.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class RegistrationUserCase: UseCase<DataModel<CheckUserData>> {
    var email: String
    var name: String
    var abilities: String

    init(_ email: String, _ name: String, _ abilities: String) {
        self.email = email
        self.name = name
        self.abilities = abilities
    }
    
    override func execute() -> Response<DataModel<CheckUserData>> {
        let authResponse: Response<DataModel<CheckUserData>> = AcademyRepository.response(apiService: .registrationUser(email: email, name: name, abilities: abilities))
        return authResponse
    }
}
