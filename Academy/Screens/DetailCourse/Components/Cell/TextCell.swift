//
//  TextCell.swift
//  Academy
//
//  Created by MovchanArtemiy on 20.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit
import SQLite

class TextCell: UITableViewCell {
    @IBOutlet weak var cellHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tapHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var descriptionHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var headText: UILabel!
    
    @IBOutlet weak var descriptionText: UILabel!
    
    @IBOutlet weak var descriptionRegistration: UILabel!
    
    @IBOutlet weak var descriptionCertificate: UILabel!
    
    @IBOutlet weak var view: UIView!
    
    var tapClosure: ((Int) -> Void)?
    var headerCountTapped: Int = 0
    
    @IBAction func tapToHeaderAction(_ sender: Any) {
        tapClosure?(((self.superview as? UITableView)?.indexPath(for: self)!.row)!)
        headerCountTapped += 1
        
    }
    
    override func awakeFromNib() {
            super.awakeFromNib()
            backgroundColor = UIColor.clear

          
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

extension TextCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let model = model as? TextCellModel else { return }

        headText.text = "Информация"
        descriptionText.text = "Участие бесплатное"
        descriptionRegistration.text = "Требуется предварительная регистрация"
        descriptionCertificate.text = "По окончании курса будут выданы сертификаты"

        var balance = headerCountTapped % 2

            if balance == 0 {
                descriptionHeightConstraint.constant =  descriptionText.frame.size.height - 150
                cellHeightConstraint.constant = descriptionHeightConstraint.constant + 44

            } else {
                descriptionHeightConstraint.constant =  descriptionText.frame.size.height + 150
                cellHeightConstraint.constant = descriptionHeightConstraint.constant + 44



            }

    }
}
