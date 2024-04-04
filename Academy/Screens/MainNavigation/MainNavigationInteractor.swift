//
//  MainNavigationInteractor.swift
//  Academy
//
//  Created by Sergey Dimitriev on 10/01/2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class MainNavigationInteractor {
    weak var output: MainNavigationInteractorOutput?
    
}

extension MainNavigationInteractor: MainNavigationInteractorInput {
    func checkAuth() {
        if(!SharedData.SelectedClientId.string().isEmpty) {
            self.output?.goToNextScreen()
//            CheckTokenCase.init(SharedData.SelectedClientId.string()).background { (ui, executor) in
//                let response = executor()
//                ui.post {
//                    let statusCode:Int = response.statusCode
//                    switch statusCode{
//                        case 200:
//
//                            break;
//
//                    default:
//                        SharedData.SelectedClientId.remove()
//                        self.output?.goToAuthScreen()
//                        break
//                    }
//                }
//            }
        } else {
            output?.goToAuthScreen()
        }
    }
}
