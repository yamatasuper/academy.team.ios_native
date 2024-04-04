//
//  DetailImageCell.swift
//  Academy
//
//  Created by MovchanArtemiy on 10.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

class ImageCell: UITableViewCell {
    
    @IBOutlet weak var headText: UILabel!
    
    @IBOutlet weak var descriptionText: UILabel!

    @IBOutlet weak var weeklyDetail: UILabel!
    
    @IBOutlet weak var view: UIImageView!
    @IBOutlet weak var imageBlack: UIImageView!

    
    var registrationFlag: Bool?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clear
        
        imageBlack.alpha = 0.8
        
        self.view.layer.borderWidth = 1
        self.view.layer.cornerRadius = 3
        self.view.layer.borderColor = UIColor.white.cgColor
        self.view.layer.masksToBounds = true
        
        self.layer.shadowOpacity = 0.48
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 8
        self.layer.shadowColor =  UIColor.black.cgColor
        self.layer.masksToBounds = false
        
    }
    
    
}

extension ImageCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let model = model as? ImageCellModel else { return }
        headText.text = model.headText
        descriptionText.text = model.descriptionText
        //weeklyDetail.text = "Занятия проходят \(model.weeklyDetail)"
        weeklyDetail.text = model.weeklyDetail

    }
}
