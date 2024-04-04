//
//  MyCoursesContainer.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

final class MyCoursesContainer: NSObject {
    let viewController: UIViewController
    private(set) weak var router: MyCoursesRouterInput!
    
    class func assemble(with input: MyCoursesModuleInput) -> MyCoursesContainer {
        let controller = MyCoursesController()
        let presenter = MyCoursesPresenter()
        let router = MyCoursesRouter()
        
        let interactor = MyCoursesInteractor()
        
        controller.output = presenter
        
        presenter.view = controller
        presenter.router = router
        presenter.interactor = interactor
        presenter.moduleInput = input
        presenter.moduleOutput = input.moduleOutput
        
        interactor.output = presenter
        
        return MyCoursesContainer(view: controller, router: router)
    }
    
    init(view: UIViewController, router: MyCoursesRouterInput) {
        viewController = view
        self.router = router
    }
}

class MyCoursesInput: MyCoursesModuleInput {
    weak var moduleOutput: MyCoursesModuleOutput?
    
    init(moduleOutput: MyCoursesModuleOutput?) {
        self.moduleOutput = moduleOutput
    }
}
