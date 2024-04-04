//
//  TabsPresenter.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class TabsPresenter {
    weak var view: TabsViewInput?
    var router: TabsRouterInput!
    var interactor: TabsInteractorInput!
    var moduleInput: TabsModuleInput?
    weak var moduleOutput: TabsModuleOutput?
    
    init() {
        
    }
}

extension TabsPresenter: TabsViewOutput {
    func hideBar() {
        view?.hideNavBar()
    }
    
    func didViewLoad() {
        print(123)
        //router.setTransitionHandler(navigation)
    }
}

extension TabsPresenter: TabsInteractorOutput {
}
