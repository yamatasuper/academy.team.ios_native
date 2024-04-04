//
//  UniversityCell.swift
//  Academy
//
//  Created by MovchanArtemiy on 03.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

class UniversityCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var universityName: UITextField!
    var closureUniversityText: ((String) -> Void)?
    var cellModel: UniversityCellModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        universityName.delegate = self
        
    }
    
    open func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
         if let text = textField.text, let textRange = Range(range, in: text) {
             var updatedText = text.replacingCharacters(in: textRange, with: string)
             
             if let model = self.cellModel {
                model.universityName = updatedText
                 closureUniversityText?(updatedText)
             }
         }
         return true;
     }
    
}

extension UniversityCell: CellModelConfigurable {
    func config(model: CellModel) {
        
        guard let model = model as? UniversityCellModel else { return }
        self.cellModel = model
        
    }
}
