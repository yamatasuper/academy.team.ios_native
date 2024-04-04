//
//  SubmitCell.swift
//  Academy
//
//  Created by Sergey Dimitriev on 13.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

open class SubmitCell: UITableViewCell {
    @IBOutlet weak var submitButton: UIButton!
    
    var cellModel: SubmitModel?
    var closureTap: ((Bool) -> Void)?
    
    open override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func submitButtonTapped (sender: UIButton) {
        closureTap?(true)
    }
}

extension SubmitCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let model = model as? SubmitModel else { return }
        self.cellModel = model
        submitButton.setTitle(model.codeType.text ,for: .normal)
        submitButton.layer.cornerRadius = 7.0
    }
}
