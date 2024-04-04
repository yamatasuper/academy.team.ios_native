//
//  NameCell.swift
//  Academy
//
//  Created by Sergey Dimitriev on 13.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

open class NameCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet weak var nameField: UITextField!
    
    var closureNameText: ((String) -> Void)?
    
    var cellModel: NameModel?
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        nameField.delegate = self
    }
    
    open func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            if let cm = self.cellModel {
                cm.nameFieldText = updatedText
                closureNameText?(updatedText)
            }
        }
        return true;
    }
}


extension NameCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let passCellModel = model as? NameModel else { return }
        self.cellModel = passCellModel
    }
}
