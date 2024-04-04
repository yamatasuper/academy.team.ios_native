//
//  FaqFactory.swift
//  Academy
//
//  Created by Sergey Dimitriev on 20.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class FaqCellModelsFactory {
    func build(questions: [Faq]) -> [CellModel] {
        var models = [CellModel]()
        for (i, question) in questions.enumerated() {
            models.append(build(question: question, id: i, status: false))
        }
        return models
    }
    
    func build(questions: [Faq], position: Int) -> [CellModel] {
        var models = [CellModel]()
        for (i, question) in questions.enumerated() {
            if i == position {
                models.append(build(question: question, id: i, status: true))
                models.append(build(answer: question.answer))
            } else{
                models.append(build(question: question, id: i, status: false))
            }
        }
        return models
    }
    
    private func build(question: Faq, id: Int, status: Bool) -> CellModel {
        return QuestionModel(textHeader: question.question, id: id, codeType: status ? .minus : .plus)
    }
     
    private func build(answer: String) -> CellModel {
        return AnswerModel(textHeader: answer)
    }
}
