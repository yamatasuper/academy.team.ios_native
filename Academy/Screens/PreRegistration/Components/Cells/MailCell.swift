//
//  MailCell.swift
//  Academy
//
//  Created by MovchanArtemiy on 03.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

class MailCell: UITableViewCell, UITextFieldDelegate {
    var token = SharedData.SelectedClientId.string()
    @IBOutlet weak var emailField: UITextField!
    var closureEmailText: ((String) -> Void)?
    
    var cellModel: MailCellModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        emailField.delegate = self
        if(token.isEmpty) {
            print("token empty")
        } else {
            emailField.isHidden = true
        }
    }
    
    open func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
         if let text = textField.text, let textRange = Range(range, in: text) {
             var updatedText = text.replacingCharacters(in: textRange, with: string)
             
             if let model = self.cellModel {
                 model.emailFieldText = updatedText
                 closureEmailText?(updatedText)
             }
         }
         return true;
     }

}

extension MailCell: CellModelConfigurable {
    func config(model: CellModel) {
        
        guard let model = model as? MailCellModel else { return }
        self.cellModel = model
        
    }
}

