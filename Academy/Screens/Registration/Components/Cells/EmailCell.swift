//
//  EmailRegistrationCell.swift
//  Academy
//
//  Created by Sergey Dimitriev on 13.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

open class EmailCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet weak var emailField: UITextField!
    
    var closureEmailText: ((String) -> Void)?
    
    var cellModel: EmailModel?
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        emailField.delegate = self
    }
    
    open func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            
            if let cm = self.cellModel {
                cm.emailFieldText = updatedText
                closureEmailText?(updatedText)
            }
        }
        return true;
    }
}


extension EmailCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let model = model as? EmailModel else { return }
        self.cellModel = model
        self.emailField.text = model.emailFieldText
    }
}
