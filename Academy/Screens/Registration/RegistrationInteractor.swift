//
//  RegistrationInteractor.swift
//  Academy
//
//  Created by Sergey Dimitriev on 13.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class RegistrationInteractor {
    weak var output: RegistrationInteractorOutput?
    var email:String = ""
    var name:String = ""
    var abilities:String = ""
    
    var cellModels: [CellModel] = [LogoModel(), EmailModel(emailFieldText: ""), NameModel(), AbilitiesModel(), SubmitModel(codeType: .registration), SkipModel(codeType: .skip)]
}

extension RegistrationInteractor: RegistrationInteractorInput {
    func setEmailInCell() {
        cellModels[1] = EmailModel(emailFieldText: self.email)
        output?.didReceived(model: cellModels[1], index: 1)
    }
    
    func startValidate() {
        RegistrationUserCase.init(self.email, self.name, self.abilities).background { (ui, executor) in
            let response = executor()
            ui.post {
                let statusCode:Int = response.statusCode
                switch statusCode{
                    case 200:
                        
                        break
                    case 201:
                        
                        break
                    case 404:
                        
                        break
                    
                default:
                    
                    break
                }
            }
        }
    }
    
    func setName(name: String) {
        self.name = name
    }
    
    func setAbilities(abilities: String) {
        self.abilities = abilities
    }
    
    var getScreenTitle: String {
        get {
            return "Регистрация"
        }
    }
    
    func setEmail(email: String) {
        self.email = email
    }
    
    func configureModels() {
        output?.didReceived(models: cellModels)
    }
}
