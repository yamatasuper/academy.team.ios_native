//
//  TitleLeftLeftCell.swift
//  Academy
//
//  Created by Sergey Dimitriev on 05.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

open class TitleLeftCell: UITableViewCell {
    @IBOutlet weak var titleLeftText: UILabel!
    @IBOutlet weak var viewWidth: NSLayoutConstraint!
    
    var closureTitleLeftText: ((String) -> Void)?
    
    var cellModel: TitleLeftModel?
    
    open override func awakeFromNib() {
        super.awakeFromNib()
    }
}


extension TitleLeftCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let model = model as? TitleLeftModel else { return }
        self.cellModel = model
        var text:String = model.codeType.text
        self.titleLeftText.text = model.codeType.text

        let array = text.split{ $0 == "\n" }
        if array.count > 1 {
            text = String(array[array.count-1])
        }
        
        let constant = text.widthWithConstrainedHeight(
            UIScreen.main.bounds.width,
            font: UIFont(name: "HelveticaNeue-Bold", size: 24)!
        )
        
        viewWidth.constant = constant - 15
    }
}

extension String{
    func widthWithConstrainedHeight(_ height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }

    func heightWithConstrainedWidth(_ width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.height)
    }
}
