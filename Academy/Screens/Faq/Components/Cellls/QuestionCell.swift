//
//  QuestionCell.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

open class QuestionCell: UITableViewCell {
    @IBOutlet weak var textHeader: UILabel!
    @IBOutlet weak var questionButton: UIButton!
    @IBOutlet weak var textWrap: UIView!
    @IBOutlet weak var questionStatus: UIButton!
    
    var closureTap: ((Int) -> Void)?
    var id:Int = 0
    
    var cellModel: QuestionModel?
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
//        textWrap.layer.shadowColor = UIColor.black.cgColor
//        textWrap.layer.shadowOpacity = 0.3
//        textWrap.layer.shadowOffset = .zero
//        textWrap.layer.shadowRadius = 3
    }
    @IBAction func questionTap(_ sender: UIButton) {
        closureTap?(self.id)
    }
}

extension QuestionCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let model = model as? QuestionModel else { return }
        self.cellModel = model
        self.textHeader.text = model.textHeader
        self.id = model.id
        
        self.questionStatus.setTitle(model.codeType.text, for: UIControl.State.normal)
    }
}
