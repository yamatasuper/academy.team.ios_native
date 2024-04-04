//
//  SkipCell.swift
//  Academy
//
//  Created by Sergey Dimitriev on 13.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

open class SkipCell: UITableViewCell {
    @IBOutlet weak var multiButton: UIButton!
    
    var cellModel: SkipModel?
    var closureTap: ((Bool) -> Void)?
    
    open override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func skipButtonTapped (sender: UIButton) {
        closureTap?(true)
    }
}


extension SkipCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let model = model as? SkipModel else { return }
        self.cellModel = model
        multiButton.setTitle(model.codeType.text ,for: .normal)
    }
}
