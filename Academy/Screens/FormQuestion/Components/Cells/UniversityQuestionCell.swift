//
//  UniversityQuestionCell.swift
//  Academy
//
//  Created by Sergey Dimitriev on 06.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

open class UniversityQuestionCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    
    var closureEmailText: ((String) -> Void)?
    var cellModel: UniversityQuestionModel?
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        textField.delegate = self
    }
    
    open func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let textRange = Range(range, in: text) {
            var updatedText = text.replacingCharacters(in: textRange, with: string)
            if let cm = self.cellModel {
                cm.emailFieldText = updatedText
                closureEmailText?(updatedText)
            }
        }
        return true;
    }
}

extension UniversityQuestionCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let passCellModel = model as? UniversityQuestionModel else { return }
        self.cellModel = passCellModel
    }
}
