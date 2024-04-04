//
//  FaqInteractor.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class FaqInteractor {
    let cellModelsFactory = FaqCellModelsFactory()
    weak var output: FaqInteractorOutput?
    var currentSelected: Int = -1
    lazy var data: [Faq] = []
}

extension FaqInteractor: FaqInteractorInput {
    var getScreenTitle: String {
        get {
            return "Faq"
        }
    }
    
    func didSelectItem(pos: Int) {
        var models:[CellModel] = []
        if self.currentSelected == pos {
            self.currentSelected = -1
            models = cellModelsFactory.build(questions: self.data)
            output?.didReceived(models: models)
        } else {
            models = cellModelsFactory.build(questions: self.data, position: pos)
        }
        output?.didReceived(models: models)
    }
    
    func configureModels() {
        if Reachability().isConnectedToNetwork() == true {
            GetFaqCase.init().background { (ui, executor) in
                let response = executor()
                ui.post {
                    let statusCode:Int = response.statusCode
                    switch statusCode{
                        case 200:
                            if let questions = response.result {
                                self.data = questions
                                let models:[CellModel] = self.cellModelsFactory.build(questions: questions)
                                self.output?.didReceived(models: models)
                            }
                            break
                    default:

                        break
                    }
                }
            }
        } else {
            print("--> No internet connection")
        }
        
        self.data = DBRepository.faqDao().getAllFaqList()
        let models:[CellModel] = cellModelsFactory.build(questions: self.data)
        output?.didReceived(models: models)
    }
}
