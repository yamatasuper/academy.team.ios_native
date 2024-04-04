//
//  FormQuestionInteractor.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

final class FormQuestionInteractor {
    weak var output: FormQuestionInteractorOutput?
    var token = SharedData.SelectedClientId.string()
    let user = DBRepository.userDao().getAllUsers().first
    var email:String = ""
    var name:String = ""
    var question:String = ""
    
    var cellModels: [CellModel] = [
        TitleModel(codeType: .formQuestion)
    ]
    
}

extension FormQuestionInteractor: FormQuestionInteractorInput {
    func setEmail(text: String) {
        self.email = text
    }
    
    func setName(text: String) {
        self.name = text
    }
    
    func setQuestion(text: String) {
        self.question = text
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self.email)
    }
    
    func validateField() {
        Events.ShowLoader.post()
        
        if token.isEmpty {
            if !self.isValidEmail() {
                Events.MessageEvent.post("E-mail введен неверно!")
                Events.HideLoader.post()
                return
            }
            
            if self.name.count < 3 {
                Events.MessageEvent.post("Необходимо заполнить поле Имя!")
                Events.HideLoader.post()
                return
            }
        }
        
        if self.question.count < 3 {
            Events.MessageEvent.post("Задайте свой вопрос!")
            Events.HideLoader.post()
            return
        }
        
        QuestionCase.init(self.email, self.name, self.question).background { (ui, executor) in
            let response = executor()
            ui.post {
                print(123)
//                switch statusCode{
//                    case 200:
//                        self.output?.goToLogin(email: self.email, name: name, social: social)
//                        Events.HideLoader.post()
//                        break
//                    case 201:
//                        Events.MessageEvent.post("Пароль был выслан вам на почту!")
//                        self.output?.goToLogin(email: self.email, name: name, social: social)
//                        Events.HideLoader.post()
//                        break
//                    case 404:
//                        self.output?.goToRegistration(email: self.email)
//                        Events.HideLoader.post()
//                        break
//
//                default:
//
//                    break
//                }
            }
        }
    }
    
    var getScreenTitle: String {
        get {
            return "Мои курсы"
        }
    }
    
    func configureModels() {
        if(token.isEmpty) {
            cellModels.append(EmailQuestionModel())
            cellModels.append(NameQuestionModel())
            //cellModels.append(UniversityQuestionModel())
        }
        cellModels.append(TextQuestionModel())
        cellModels.append(ButtonQuestionModel(codeType: .send))
        
        self.output?.didReceived(models: cellModels)
    }
}
