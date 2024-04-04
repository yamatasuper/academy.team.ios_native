//
//  AboutInteractor.swift
//  Academy
//
//  Created by Sergey Dimitriev on 10/01/2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class AboutInteractor {
    weak var output: AboutInteractorOutput?
    var email:String = ""
    
    var cellModels: [CellModel] = [
        //TitleLeftModel(codeType: .about),
        AboutTextModel(),
        SocialLinksModel(),
        TitleLeftModel(codeType: .forMap),
        MapModel()
    ]
}

extension AboutInteractor: AboutInteractorInput {
    var getScreenTitle: String {
        get {
            return "О нас"
        }
    }
    
    func configureModels() {
        output?.didReceived(models: cellModels)
    }
}
