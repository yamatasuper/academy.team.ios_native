//
//  CoursesContainer.swift
//  Academy
//
//  Created by MovchanArtemiy on 10.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

 final public class CoursesViewContainer: NSObject {
    let viewController: UIViewController
    private(set) weak var router: CoursesRouterInput!

     class func assemble(with input: CoursesModuleInput) -> CoursesViewContainer {
        let controller = CoursesViewController()
        let presenter = CoursesPresenter()
        let router = CoursesRouter()

        let interactor = CoursesInteractor()

        controller.output = presenter

        presenter.view = controller
        presenter.router = router
        presenter.interactor = interactor
        presenter.moduleInput = input
        presenter.moduleOutput = input.moduleOutput

        interactor.output = presenter

        return CoursesViewContainer(view: controller, router: router)
    }

    private init(view: UIViewController, router: CoursesRouterInput) {
        viewController = view
        self.router = router
    }
}

class CoursesViewControllerInput: CoursesModuleInput {
    weak var moduleOutput: CoursesModuleOutput?

    init(moduleOutput: CoursesModuleOutput?) {
        self.moduleOutput = moduleOutput
    }
}

