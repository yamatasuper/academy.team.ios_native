//
//  DetailCourseRouter.swift
//  Academy
//
//  Created by MovchanArtemiy on 20.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class DetailCourseRouter {
    private(set) weak var transitionHandler: TransitionHandlerProtocol?
}

extension DetailCourseRouter: DetailCourseRouterInput {
    func goToDetailScreen(id: Int, tableName: String) {
         let vc = DetailCourseContainer.assemble(with: DetailCourseInput(moduleOutput: nil, id: id, tableName: tableName)).viewController
         transitionHandler?.pushViewController(vc, animated: true)
     }
    
    func goToDetailDirectionsScreen(id: Int, tableName: String) {
        let vc = DetailCourseContainer.assemble(with: DetailCourseInput(moduleOutput: nil, id: id, tableName: tableName)).viewController
           transitionHandler?.pushViewController(vc, animated: true)
       }
    
    func goToRegistration(registration: Bool) {
        let vc = RegistrationContainer.assemble(with: RegistrationInput(moduleOutput: nil, email: "")).viewController
        transitionHandler?.pushViewController(vc, animated: true)
    }
    
    func setTransitionHandler(_ transitionHandler: TransitionHandlerProtocol?) {
        self.transitionHandler = transitionHandler
    }

    
}
