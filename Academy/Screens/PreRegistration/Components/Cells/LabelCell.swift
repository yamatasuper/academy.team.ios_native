//
//  LabelCell.swift
//  Academy
//
//  Created by MovchanArtemiy on 03.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

class LabelCell: UITableViewCell {
 
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
}

extension LabelCell: CellModelConfigurable {
    func config(model: CellModel) {
        
        guard let model = model as? LabelCellModel else { return }

        
    }
}
