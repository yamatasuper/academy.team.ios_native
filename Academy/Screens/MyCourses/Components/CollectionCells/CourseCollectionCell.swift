//
//  CourseCollectionCell.swift
//  Academy
//
//  Created by Sergey Dimitriev on 27.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

open class CourseCollectionCell: UICollectionViewCell {
    @IBOutlet weak var collectionWrap: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    var cellModel: UserInfoModel?
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionWrap.layer.shadowColor = UIColor.black.cgColor
        collectionWrap.layer.shadowOffset = .zero
        collectionWrap.layer.shadowOpacity = 0.2
        collectionWrap.layer.shadowRadius = 5
        collectionWrap.layer.cornerRadius = 5
    }
}

extension CourseCollectionCell: CollectionCellModelConfigurable {
    func config(model: CollectionCellModel) {
        guard let model = model as? CourseCollectionModel else { return }
        
        var textStartDateFinal = ""
        var textEndDateFinal = ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let startDate = dateFormatter.date(from: model.item.date_start ?? "")
        let endDate = dateFormatter.date(from: model.item.date_completion ?? "")
        
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "dd MMMM yyyy"
        
        var textDate = ""
        
        if let startDate = startDate {
            let startDateFinal = dateFormatter.string(from: startDate)
            textStartDateFinal = "С \(startDateFinal)"
        }
        if let endDate = endDate {
            let endDate = dateFormatter.string(from: endDate)
            textEndDateFinal = "\n по \(endDate)"
        }
        
        self.titleLabel.text = model.item.title
        self.dateLabel.text = "\(textStartDateFinal)\(textEndDateFinal)"
        
//        var status = "Курс незавершен!"
//        if model.item.completed == 1 {
//            status = "Курс завершен!"
//        } else if model.item.listened == 1 {
//            status = "Курс прослушан!"
//        }
        self.statusLabel.text = model.item.status
    }
}
