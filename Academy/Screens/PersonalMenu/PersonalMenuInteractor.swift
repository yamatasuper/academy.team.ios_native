//
//  PersonalMenuInteractor.swift
//  Academy
//
//  Created by Sergey Dimitriev on 11.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class PersonalMenuInteractor {
    weak var output: PersonalMenuInteractorOutput?
    
    var cellModels: [CellModel] = [
        MenuLinkModel(codeType: .calendary, tag: 1),
        MenuLinkModel(codeType: .update, tag: 2),
        MenuLinkModel(codeType: .settings, tag: 3),
        MenuLinkModel(codeType: .logout, tag: 4)
    ]
}

extension PersonalMenuInteractor: PersonalMenuInteractorInput {
    func directionSelection(tag: Int) {
        switch tag {
            
            case 1:
            break
            case 2:
            break
            case 3:
            break
            case 4:
                SharedData.SelectedClientId.remove()
                output?.goToAuthScreen()
            break
            
        default:
            break
        }
    }
    
    var getScreenTitle: String {
        get {
            return "Меню"
        }
    }
    
    func configureModels() {
        output?.didReceived(models: cellModels)
    }
}
