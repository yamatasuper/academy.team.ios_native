//
//  LogoCell.swift
//  Academy
//
//  Created by Sergey Dimitriev on 13.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

open class LogoCell: UITableViewCell {
    
    @IBOutlet weak var logoWrap: UIView!
    @IBOutlet weak var logo: UIImageView?
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    
    var cellModel: LogoModel?
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}


extension LogoCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let passCellModel = model as? LogoModel else { return }
        self.cellModel = passCellModel
    }
}
