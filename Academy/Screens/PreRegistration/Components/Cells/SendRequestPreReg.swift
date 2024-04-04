//
//  SendRequestPreReg.swift
//  Academy
//
//  Created by MovchanArtemiy on 03.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

class SendRequestPreRegCell: UITableViewCell {
    
    var closureNextButtonTapped: ((Bool) -> Void)?
    var cellModel: SendRequestPreRegCellModel?
    
    @IBAction func sendRequest(_ sender: Any) {
        closureNextButtonTapped?(true)

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
}

extension SendRequestPreRegCell: CellModelConfigurable {
    func config(model: CellModel) {
        
        guard let model = model as? SendRequestPreRegCellModel else { return }
        self.cellModel = model
        
    }
}
