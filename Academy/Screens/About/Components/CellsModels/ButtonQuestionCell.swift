//
//  ButtonQuestionCell.swift
//  Academy
//
//  Created by Sergey Dimitriev on 06.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

open class ButtonQuestionCell: UITableViewCell {
    @IBOutlet weak var multiButton: UIButton!
    
    var cellModel: ButtonQuestionModel?
    var closureTap: ((Bool) -> Void)?
    
    open override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func ButtonQuestionButtonTapped (sender: UIButton) {
        closureTap?(true)
    }
}

extension ButtonQuestionCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let model = model as? ButtonQuestionModel else { return }
        self.cellModel = model
        multiButton.setTitle(model.codeType.text ,for: .normal)
    }
}
