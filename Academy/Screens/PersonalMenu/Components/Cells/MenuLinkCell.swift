//
//  MenuLinkCell.swift
//  Academy
//
//  Created by Sergey Dimitriev on 11.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

open class MenuLinkCell: UITableViewCell {
    @IBOutlet weak var linkButton: UIButton!
    
    var cellModel: MenuLinkModel?
    var closureTap: ((Int) -> Void)?
    
    open override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func MenuLinkButtonTapped (sender: UIButton) {
        closureTap?(sender.tag)
    }
}

extension MenuLinkCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let model = model as? MenuLinkModel else { return }
        self.cellModel = model
        linkButton.setTitle(model.codeType.text ,for: .normal)
        linkButton.tag = model.tag
    }
}
