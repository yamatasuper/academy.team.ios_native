//
//  MyCoursesCase.swift
//  Academy
//
//  Created by Sergey Dimitriev on 27.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class CheckMyCoursesCase: UseCase<[MyCoursesList]> {
    var token: String

    init(_ token: String) {
        self.token = token
    }
    
    override func execute() -> Response<[MyCoursesList]> {
        let authResponse: Response<[MyCoursesList]> = AcademyRepository.response(apiService: .checkMyCourses(token: token))
        return authResponse
    }
}
