//
//  Moya.swift
//  Academy
//
//  Created by Sergey Dimitriev on 13.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import Moya

let AcademyRepository = AcademyProvider()

class AcademyProvider: BaseProvider<AcademyService> {}

enum AcademyService {
    // Auth
    case checkUser(email: String)
    case registrationUser(email: String, name: String, abilities: String)
    case signin_password(email: String, password: String)
    case reset_password(email: String)
    case checkToken(token: String)
    
    // Courses
    case coursesList(publish: Bool)
    
    //Faq
    case getFaq
    
    //MyCourses
    case checkMyCourses(token: String)
    
    //ScheduleRegistration
    case scheduleRegister(schedule_id: Int, email: String, name: String, ability: String)
    
    //PreRegistration
    case preRegister(email: String, name: String, code_technology_or_group: String, university: String)
    
    //List courses preRegistration
    case preRegListCourses
    case sendQuestion(email: String, name: String, question: String)
}

extension AcademyService : TargetType {
    
    var headers: [String: String]? {
        var httpHeaders:[String: String] = [:]

        httpHeaders["Accept"] = "application/json"
        httpHeaders["Content-Type"] = "application/json"
        
        return httpHeaders
    }
    
    var baseURL: URL {
        return URL(string: "https://")!
    }
    
    var path: String {
        switch self {
            
        case .coursesList(_):
            return "/"
            
        case .checkUser:
            return "/"
            
        case .registrationUser:
            return "/"
            
        case .signin_password:
            return "/"
            
        case .reset_password:
            return "/"
        
        case .checkToken:
            return "/"
            
        case .getFaq:
            return "/"
            
        case .checkMyCourses:
            return "/"
            
        case .sendQuestion:
            return "/"
            
        case .scheduleRegister:
            return "/"
        
        case .preRegister:
            return "/"
            
        case .preRegListCourses:
            return "/"
            
        }
    }
    
    var method: Moya.Method {
        switch self{
            
        case .checkUser, .registrationUser, .signin_password, .reset_password, .sendQuestion, .scheduleRegister, .preRegister:
			return .post
            
        default:
            return .get
        }
    }
    
    var parameters: [String: Any] {
        switch self {
            
            case .checkUser(let email):
                var parameters = [String: Any]()
                parameters["email"] = email
                return parameters
            case .registrationUser(let email, let name, let abilities):
                var parameters = [String: Any]()
                parameters["email"] = email
                parameters["name"] = name
                parameters["abilities"] = abilities
                return parameters
            
            case .signin_password(let email, let password):
                var parameters = [String: Any]()
                parameters["email"] = email
                parameters["password"] = password
                return parameters
            
            case .reset_password(let email):
                var parameters = [String: Any]()
                parameters["email"] = email
                return parameters
            
            case .checkToken (let token):
                var parameters = [String: Any]()
                parameters["access-token"] = token
                return parameters

            case .coursesList(let publish):
                var parameters = [String: Any]()
                parameters["publish"] = publish
                return parameters
            
            case .checkMyCourses(let token):
                var parameters = [String: Any]()
                parameters["access-token"] = token
                return parameters
            
            case .sendQuestion(let email, let name, let question):
                var parameters = [String: Any]()
                parameters["email"] = email
                parameters["name"] = name
                parameters["message"] = question
                return parameters
	        case .scheduleRegister(let schedule_id, let email, let name, let ability):
	            var parameters = [String: Any]()
	            parameters["schedule_id"] = schedule_id
	            parameters["email"] = email
	            parameters["name"] = name
	            parameters["ability"] = ability
	            return parameters
	            
	        case .preRegister(let email, let name, let code_technology_or_group, let university):
	            var parameters = [String: Any]()
	            parameters["email"] = email
	            parameters["name"] = name
	            parameters["code_technology_or_group"] = code_technology_or_group
	            parameters["university"] = university
	            return parameters
            
            
        default:
            return [:]
        }
    }
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    var sampleData: Data {
        return Data()
    }
    var task: Task {
        switch self {
            
        case .checkUser, .registrationUser, .signin_password, .reset_password, .preRegister, .preRegListCourses, .sendQuestion:
			return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case .checkToken, .coursesList, .getFaq, .checkMyCourses, .scheduleRegister:
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
                        
        default:
            return .requestPlain
        }
    }
}
