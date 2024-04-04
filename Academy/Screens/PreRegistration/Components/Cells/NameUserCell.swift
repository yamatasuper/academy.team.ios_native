//
//  NameCell.swift
//  Academy
//
//  Created by MovchanArtemiy on 03.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

class NameUserCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var userNameField: UITextField!
    var closureNameText: ((String) -> Void)?
    var cellModel: NameUserCellModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userNameField.delegate = self
    }
    
    open func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
         if let text = textField.text, let textRange = Range(range, in: text) {
             var updatedText = text.replacingCharacters(in: textRange, with: string)
             
             if let model = self.cellModel {
                model.userNameField = updatedText
                 closureNameText?(updatedText)
             }
         }
         return true;
     }
    
}

extension NameUserCell: CellModelConfigurable {
    func config(model: CellModel) {
        
        guard let model = model as? NameUserCellModel else { return }
        self.cellModel = model
        
    }
}
