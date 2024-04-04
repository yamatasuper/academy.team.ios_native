//
//  FormFormQuestionCell.swift
//  Academy
//
//  Created by Sergey Dimitriev on 24.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

open class FormQuestionCell: UITableViewCell {
    @IBOutlet weak var textHeader: UILabel!
    @IBOutlet weak var formQuestionButton: UIButton!
    @IBOutlet weak var textWrap: UIView!
    @IBOutlet weak var formQuestionStatus: UIButton!
    
    var closureTap: ((Int) -> Void)?
    var id:Int = 0
    
    var cellModel: FormQuestionModel?
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        textWrap.layer.shadowColor = UIColor.black.cgColor
        textWrap.layer.shadowOpacity = 0.3
        textWrap.layer.shadowOffset = .zero
        textWrap.layer.shadowRadius = 3
        
        Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(self.alarmAlertActivate), userInfo: nil, repeats: true)
    }
    
    @IBAction func FormQuestionTap(_ sender: UIButton) {
        closureTap?(self.id)
    }
    
    @objc func alarmAlertActivate(){
        UIView.animate(withDuration: 0.7) {
            self.textWrap.alpha = self.textWrap.alpha == 1.0 ? 0.0 : 1.0
        }
    }
}

extension FormQuestionCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let model = model as? FormQuestionModel else { return }
        self.cellModel = model
        self.textHeader.text = model.textHeader
        self.id = model.id
        
        //self.FormQuestionStatus.setTitle(model.codeType.text, for: UIControl.State.normal)
    }
}
