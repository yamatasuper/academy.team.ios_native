//
//  TitleCell.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

open class TitleCell: UITableViewCell {
    @IBOutlet weak var titleText: UILabel!
    
    var closureTitleText: ((String) -> Void)?
    var cellModel: TitleModel?
    
    open override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension TitleCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let model = model as? TitleModel else { return }
        self.cellModel = model
        self.titleText.text = model.codeType.text
    }
}
