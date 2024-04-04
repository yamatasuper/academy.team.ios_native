//
//  GetFaqCase.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class GetFaqCase: UseCase<[Faq]> {

    override init() {}
    
    override func execute() -> Response<[Faq]> {
        let authResponse: Response<FaqData> = AcademyRepository.response(apiService: .getFaq)
        
        var faqs: [Faq] = []
        if let arrRes = authResponse.result?.questions {
            for item in arrRes {
                let question = item.toDb()
                faqs.append(question)
            }
        }
        if !faqs.isEmpty {
            DBRepository.faqDao().deleteAndInsertAll(faqs)
        }
        
        return Response.init(faqs, authResponse.error, authResponse.statusCode)
    }
}
extension FaqItemData {
    func toDb() -> Faq {
        let id: Int = Int(Calendar.current.date(byAdding: .day, value: 1, to: Date())!.timeIntervalSince1970) + Int.random(in: 0 ..< 10)
        let faq = Faq()
        faq.id = id
        faq.question = self.question!
        faq.answer = self.answer!
        faq.sorting = self.sorting!
        
        return faq
    }
}
