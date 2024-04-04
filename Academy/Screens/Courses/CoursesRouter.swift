//
//  CoursesRouter.swift
//  Academy
//
//  Created by MovchanArtemiy on 10.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class CoursesRouter {
    private(set) weak var transitionHandler: TransitionHandlerProtocol?
}

extension CoursesRouter: CoursesRouterInput {
    func goToDetailScreen(id: Int, tableName: String) {
        let vc = DetailCourseContainer.assemble(with: DetailCourseInput(moduleOutput: nil, id: id, tableName: tableName)).viewController
        transitionHandler?.pushViewController(vc, animated: true)
    }
    
    func goToPreliminary() {

        let vc = PreRegistrationContainer.assemble(with: PreRegistrationInput(moduleOutput: nil)).viewController
        transitionHandler?.pushViewController(vc, animated: true)
    }
    
    func setTransitionHandler(_ transitionHandler: TransitionHandlerProtocol?) {
        self.transitionHandler = transitionHandler
        
    }
    
    
}
