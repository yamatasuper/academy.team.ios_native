//
//  QuestionCase.swift
//  Academy
//
//  Created by Sergey Dimitriev on 10.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class QuestionCase: UseCase<QuestionResultResponse> {
    var email: String
    var name: String
    var question: String

    init(_ email: String, _ name: String, _ question: String) {
        self.email = email
        self.name = name
        self.question = question
    }
    
    override func execute() -> Response<QuestionResultResponse> {
        let authResponse: Response<QuestionResultResponse> = AcademyRepository.response(apiService: .sendQuestion(email: email, name: name, question: question))
        return authResponse
    }
}
