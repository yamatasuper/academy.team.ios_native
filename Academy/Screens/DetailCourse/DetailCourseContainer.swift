//
//  DetailCourseContainer.swift
//  Academy
//
//  Created by MovchanArtemiy on 20.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

final class DetailCourseContainer: NSObject {
    let viewController: UIViewController
    private(set) weak var router: DetailCourseRouterInput!

    class func assemble(with input: DetailCourseModuleInput) -> DetailCourseContainer {
        let controller = DetailCourseViewController()
        let presenter = DetailCoursePresenter()
        let router = DetailCourseRouter()

        let interactor = DetailCourseInteractor()

        controller.output = presenter

        presenter.view = controller
        presenter.router = router
        presenter.interactor = interactor
        presenter.moduleInput = input
        presenter.moduleOutput = input.moduleOutput

        interactor.output = presenter

        return DetailCourseContainer(view: controller, router: router)
    }

    init(view: UIViewController, router: DetailCourseRouterInput) {
        viewController = view
        self.router = router
    }
}

class DetailCourseInput: DetailCourseModuleInput {
    var tableName: String
    
    weak var moduleOutput: DetailCourseModuleOutput?
    var id: Int = 0

    init(moduleOutput: DetailCourseModuleOutput?, id: Int, tableName: String) {
        self.moduleOutput = moduleOutput
        self.id = id
        self.tableName = tableName

    }
}

