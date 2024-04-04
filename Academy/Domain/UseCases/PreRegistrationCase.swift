//
//  PreRegUserCase.swift
//  Academy
//
//  Created by MovchanArtemiy on 04.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class PreRegistrationCase: UseCase<DataModel<CheckPreRegistrationData>> {
    var email: String
    var name: String
    var code_technology_or_group: String
    var university: String

    init(_ email: String, _ name: String, _ code_technology_or_group: String, _ university: String) {
        self.email = email
        self.name = name
        self.code_technology_or_group = code_technology_or_group
        self.university = university
    }
    
    override func execute() -> Response<DataModel<CheckPreRegistrationData>> {
        let authResponse: Response<DataModel<CheckPreRegistrationData>> = AcademyRepository.response(apiService: .preRegister(email: email, name: name, code_technology_or_group: code_technology_or_group, university: university))
        return authResponse
    }
}
