//
//  LoginInteractor.swift
//  Academy
//
//  Created by Sergey Dimitriev on 14.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class LoginInteractor {
    weak var output: LoginInteractorOutput?
    var email:String = ""
    var name:String = ""
    var social:String = ""
    var password:String = ""
    
    var cellModels: [CellModel] = [
        LogoModel(),
        PassModel(),
        SubmitModel(codeType: .auth),
        SkipModel(codeType: .reset)
    ]
}

extension LoginInteractor: LoginInteractorInput {
    func setName(text: String) {
        self.name = text
    }
    
    func setSocial(text: String) {
        self.social = text
    }
    
    func resetPassword() {
        Events.ShowLoader.post()
        ResetPasswordCase.init(self.email).background { (ui, executor) in
            let response = executor()
            ui.post {
                let statusCode:Int = response.statusCode
                switch statusCode{
                    case 200:
                        print("200")
                        break;
                    case 201:
                        Events.MessageEvent.post("Новый пароль был отправлен на почту.")
                        Events.HideLoader.post()
                        break;
                    case 403:
                        print("403")
                        break;
                    case 404:
                        print("404")
                        break;

                default:

                    break
                }
            }
        }
    }
    
    var getScreenTitle: String {
        get {
            return "Вход"
        }
    }
    
    func setEmail(text: String) {
        self.email = text
    }
    
    func setPassword(password: String) {
        self.password = password
    }
    
    func configureModels() {
        output?.didReceived(models: cellModels)
    }
    
    func validatePassword() {
        Events.ShowLoader.post()
        if self.password.count < 8 {
            Events.MessageEvent.post("Пароль должен содержать минимум 8 символов!")
            Events.HideLoader.post()
            return
        }
        
        SigninPasswordCase.init(self.email, self.password).background { (ui, executor) in
            let response = executor()
            ui.post {
                let statusCode:Int = response.statusCode
                var token:String = response.result ?? ""
                token = token.replacingOccurrences(of: "\"", with: "", options: NSString.CompareOptions.literal, range:nil)
                
                switch statusCode{
                    case 200:
                        print("200")
                        SharedData.SelectedClientId.saveValue(token)
                        
                        if let user = DBRepository.userDao().getAllUsers().first {
                            let oldUserEmail = user.email
                            if self.email != oldUserEmail {
                                DBRepository.userDao().deleteAllAndInsert(user)
                            }
                        } else {
                            var user:User = User()
                            user.id = 1
                            user.email = self.email
                            user.token = token
                            user.password = self.password
                            user.social = self.social
                            user.name = self.name
                            
                            DBRepository.userDao().deleteAllAndInsert(user)
                        }
                        
                        self.output?.goToNextScreen()
                        Events.HideLoader.post()
                        break
                    case 201:
                        print("201")
                        break
                    case 403:
                        Events.MessageEvent.post("Проверьте правильность логина или пароля.")
                        Events.HideLoader.post()
                        break
                    case 404:
                        print("404")
                        break
                default:

                    break
                }
            }
        }
    }
}
