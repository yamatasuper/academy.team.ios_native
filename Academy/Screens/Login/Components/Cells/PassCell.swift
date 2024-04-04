//
//  PassCell.swift
//  Academy
//
//  Created by Sergey Dimitriev on 14.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

open class PassCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet weak var passField: UITextField!
    
    var closurePassText: ((String) -> Void)?
    
    var cellModel: PassModel?
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        passField.delegate = self
    }
    
    open func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            if let cm = self.cellModel {
                cm.passFieldText = updatedText
                closurePassText?(updatedText)
            }
        }
        return true;
    }
}


extension PassCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let model = model as? PassModel else { return }
        self.cellModel = model
        self.passField.text = model.passFieldText
    }
}
