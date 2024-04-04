//
//  AuthInteractor.swift
//  Academy
//
//  Created by Sergey Dimitriev on 10/01/2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class AuthInteractor {
    weak var output: AuthInteractorOutput?
    var email:String = ""
    
    var cellModels: [CellModel] = [LogoModel(), TaglineModel(), EmailAuthModel(), SkipModel(codeType: .skip)]
}

extension AuthInteractor: AuthInteractorInput {
    func setEmail(email: String) {
        self.email = email
    }
    
    func configureModels() {
        output?.didReceived(models: cellModels)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self.email)
    }
    
    func checkUserReguest() {
        Events.ShowLoader.post()
        if !self.isValidEmail() {
            Events.MessageEvent.post("E-mail введен неверно!")
            Events.HideLoader.post()
            return
        }
        
        CheckUserCase.init(self.email).background { (ui, executor) in
            let response = executor() 
            ui.post {
                let statusCode:Int = response.statusCode
                let social:String = response.result?.social ?? ""
                let name:String = response.result?.username ?? ""
                
                switch statusCode{
                    case 200:
                        self.output?.goToLogin(email: self.email, name: name, social: social)
                        Events.HideLoader.post()
                        break
                    case 201:
                        Events.MessageEvent.post("Пароль был выслан вам на почту!")
                        self.output?.goToLogin(email: self.email, name: name, social: social)
                        Events.HideLoader.post()
                        break
                    case 404:
                        self.output?.goToRegistration(email: self.email)
                        Events.HideLoader.post()
                        break
                    
                default:
                    
                    break
                }
            }
        }
    }
}
