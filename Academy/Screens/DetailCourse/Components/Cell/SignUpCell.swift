//
//  SignUp.swift
//  Academy
//
//  Created by MovchanArtemiy on 28.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

class SignUpCell: UITableViewCell {
    
    @IBOutlet weak var headName: UILabel!
    
    @IBOutlet weak var position: UILabel!
    
    @IBOutlet weak var view: UIView!
    
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

extension SignUpCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let model = model as? SignUpCellModel else { return }
        headName.text = model.headName
        position.text = model.position
    }
    
}
