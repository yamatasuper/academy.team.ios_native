//
//  MyCoursesInteractor.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

final class MyCoursesInteractor {
    weak var output: MyCoursesInteractorOutput?
    var token = SharedData.SelectedClientId.string()
    let user = DBRepository.userDao().getAllUsers().first
    var models:[CellModel] = [
        TitleLeftModel(codeType: .personalInfo)
    ]
}

extension MyCoursesInteractor: MyCoursesInteractorInput {
    var getScreenTitle: String {
        get {
            return "Мои курсы"
        }
    }
    
    func checkAuth() {
        if(token.isEmpty) {
            output?.goToAuthScreen()
        } else {
            self.configureModels()
        }
    }
    
    func configureModels() {
        Events.ShowLoader.post()
        if Reachability().isConnectedToNetwork() == true {
            CheckMyCoursesCase.init(self.token).background { (ui, executor) in
                let response = executor()
                ui.post {
                    let statusCode:Int = response.statusCode
                    
                    
                    if !self.user!.name.isEmpty {
                        self.models.append(UserInfoModel(title: "ФИО", text: self.user!.name))
                    }
                    if !self.user!.email.isEmpty {
                        self.models.append(UserInfoModel(title: "Почта", text: self.user!.email))
                    }
                    self.models.append(TitleLeftModel(codeType: .myCourses))
                    
                    
                    switch statusCode {
                        case 200:
                            if let list = response.result {
                                self.models.append(CollectionListModel(list: list))
                            }
                        break
                        
                    default:
                        
                        break
                    }
                    Events.HideLoader.post()
                    self.output?.didReceived(models: self.models)
                }
            }
        } else {
            print("--> No internet connection")
        }
        
    }
}
