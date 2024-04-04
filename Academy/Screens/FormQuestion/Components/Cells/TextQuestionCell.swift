//
//  TextQuestionCell.swift
//  Academy
//
//  Created by Sergey Dimitriev on 10.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

open class TextQuestionCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet weak var emailField: UITextField!
    
    var closureText: ((String) -> Void)?
    var cellModel: TextQuestionModel?
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        emailField.delegate = self
    }
    
    open func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let textRange = Range(range, in: text) {
            var updatedText = text.replacingCharacters(in: textRange, with: string)
            if let cm = self.cellModel {
                cm.emailFieldText = updatedText
                closureText?(updatedText)
            }
        }
        return true;
    }
}

extension TextQuestionCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let passCellModel = model as? TextQuestionModel else { return }
        self.cellModel = passCellModel
    }
}
