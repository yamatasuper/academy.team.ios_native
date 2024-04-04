//
//  MyCoursesContainer.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

final class FormQuestionContainer: NSObject {
    let viewController: UIViewController
    private(set) weak var router: FormQuestionRouterInput!
    
    class func assemble(with input: FormQuestionModuleInput) -> FormQuestionContainer {
        let controller = FormQuestionController()
        let presenter = FormQuestionPresenter()
        let router = FormQuestionRouter()
        
        let interactor = FormQuestionInteractor()
        
        controller.output = presenter
        
        presenter.view = controller
        presenter.router = router
        presenter.interactor = interactor
        presenter.moduleInput = input
        presenter.moduleOutput = input.moduleOutput
        
        interactor.output = presenter
        
        return FormQuestionContainer(view: controller, router: router)
    }
    
    init(view: UIViewController, router: FormQuestionRouterInput) {
        viewController = view
        self.router = router
    }
}

class FormQuestionInput: FormQuestionModuleInput {
    weak var moduleOutput: FormQuestionModuleOutput?
    
    init(moduleOutput: FormQuestionModuleOutput?) {
        self.moduleOutput = moduleOutput
    }
}
