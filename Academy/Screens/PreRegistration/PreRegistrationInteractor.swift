//
//  PreRegistrationInteractor.swift
//  Academy
//
//  Created by MovchanArtemiy on 03.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class PreRegistrationInteractor {
    weak var output: PreRegistrationInteractorOutput?
    let aboutViewTableFactory = PreRegistrationFactory()
    var token = SharedData.SelectedClientId.string()
    let user = DBRepository.userDao().getAllUsers().first
    
    var models: [CellModel] = []

    var email: String = ""
    var userName: String = ""
    var code_technology_or_group = ""
    
    var universityName: String = ""
    var schedule: String = ""
    
    var lastExpandedIndex: Int = -1
    
    
    init() {
        //models = self.aboutViewTableFactory.build()
    }
    
}

extension PreRegistrationInteractor: PreRegistrationInteractorInput {
    func setEmail(email: String) {
           self.email = email
       }
    
    func setUserName(userName: String) {
        self.userName = userName
        if(token.isEmpty) {
                 print("token empty")
                 
                 } else {
                 self.email = user!.email
                 print("token not empty \(token) and user \(user?.email)")
                 }
    }
    
    func setUniversityName(universityName: String) {
          self.universityName = universityName
    }
    
    func setScheduleName(schedule: String) {
        self.code_technology_or_group = schedule
    }
    
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self.email)
        return false
    }
    
    func checkUserReguest() {
    Events.ShowLoader.post()
    if !self.isValidEmail() {
        Events.MessageEvent.post("E-mail введен неверно!")
        Events.HideLoader.post()
        return
    }
        print("token mail \(self.email), user \(self.userName), codetech \(self.code_technology_or_group), univer \(self.universityName )")
//        PreRegistrationCase.init(self.email, self.userName, self.code_technology_or_group, self.universityName).background { (ui, executor) in
//            let response = executor()
//            ui.post {
//                let statusCode:Int = response.statusCode
//                switch statusCode{
//                    case 200:
//                        Events.HideLoader.post()
//                        break
//                    case 201:
//                        Events.MessageEvent.post("Пароль был выслан вам на почту!")
//                        Events.HideLoader.post()
//                        break
//                    case 404:
//                        print("404 error")
//                        Events.HideLoader.post()
//                        break
//
//                default:
//
//                    break
//                }
//            }
//        }
    }
    
    
    
    func configureModels() {
//        self.models = self.aboutViewTableFactory.build()
//        output?.didReceived(models: models)
    }
    
    func loadListCourses() {
        var coursesDictionary = Dictionary<String,String>()
        self.models = self.aboutViewTableFactory.build(schedules: coursesDictionary)
        output?.didReceived(models: models)
        do {
            if let file = URL(string: "/") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: String] {
                    coursesDictionary = object
                    self.models = self.aboutViewTableFactory.build(schedules: coursesDictionary)
                    output?.didReceived(models: models)
                } else if let object = json as? [Any] {
                    for anItem in object as! [Dictionary<String, AnyObject>] {
                        let courseName = anItem["name"] as! String
                        let courseDescription = anItem["description"] as! String

                    }
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }

    func didObtainModels() {
           
    }
    
}

