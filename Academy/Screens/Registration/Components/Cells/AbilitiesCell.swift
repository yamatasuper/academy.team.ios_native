//
//  AbilitiesCell.swift
//  Academy
//
//  Created by Sergey Dimitriev on 13.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

open class AbilitiesCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet weak var abilitiesField: UITextField?
    
    var closureAbilitiesText: ((String) -> Void)?
    
    var cellModel: AbilitiesModel?
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        abilitiesField?.delegate = self
    }
    
    open func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            if let cm = self.cellModel {
                cm.abilitiesFieldText = updatedText
                closureAbilitiesText?(updatedText)
            }
        }
        return true;
    }
}


extension AbilitiesCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let passCellModel = model as? AbilitiesModel else { return }
        self.cellModel = passCellModel
    }
}
