//
//  TextCell.swift
//  Academy
//
//  Created by Sergey Dimitriev on 22.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

class AboutTextCell: UITableViewCell {
    @IBOutlet weak var labelText: UILabel!
    
    var cellModel: AboutTextModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension AboutTextCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let model = model as? AboutTextModel else { return }
        self.cellModel = model
        
        labelText.attributedText = "<span><strong>Академия разработки MediaSoft</strong></b> — шанс получить систематизированные знания под руководством действующих программистов, которые владеют актуальными технологиями и участвуют в разработке коммерчески успешных продуктов.<br><br>Обучение в академии полностью <b><strong>БЕСПЛАТНО</strong>.</span>".htmlToAttributedString
        labelText.font = UIFont(name: "HelveticaNeue", size: 16)
    }
}
