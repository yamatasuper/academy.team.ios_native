//
//  TaglineCell.swift
//  Academy
//
//  Created by Sergey Dimitriev on 04.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

open class TaglineCell: UITableViewCell {
    @IBOutlet weak var labelText: UILabel!
    
    var cellModel: TaglineModel?
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        labelText.text = "Помогаем преодолеть пропасть между \n знаниями и реальной работой"
    }
}


extension TaglineCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let model = model as? TaglineModel else { return }
        self.cellModel = model
    }
}
