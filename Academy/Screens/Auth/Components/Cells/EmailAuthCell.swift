//
//  EmailAuthCell.swift
//  Academy
//
//  Created by Sergey Dimitriev on 13.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

open class EmailAuthCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var buttonNext: UIButton!
    
    var closureEmailText: ((String) -> Void)?
    var closureNextButtonTapped: ((Bool) -> Void)?
    
    var cellModel: EmailAuthModel?
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        emailField.delegate = self
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
    
    @IBAction func nextButtonTapped(sender: UIButton) {
        closureNextButtonTapped?(true)
    }
}


extension EmailAuthCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let passCellModel = model as? EmailAuthModel else { return }
        self.cellModel = passCellModel
        buttonNext.roundedButton()
    }
}
