//
//  ResetPasswordCase.swift
//  Academy
//
//  Created by Sergey Dimitriev on 15.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class ResetPasswordCase: UseCase<DataModel<ResetPasswordData>> {
    var email: String

    init(_ email: String) {
        self.email = email
    }
    
    override func execute() -> Response<DataModel<ResetPasswordData>> {
        let authResponse: Response<DataModel<ResetPasswordData>> = AcademyRepository.response(apiService: .reset_password(email: email))
        return authResponse
    }
}
