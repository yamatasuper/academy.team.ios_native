//
//  AnswerCell.swift
//  Academy
//
//  Created by Sergey Dimitriev on 21.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit
import WebKit

class AnswerCell: UITableViewCell, WKNavigationDelegate {
    @IBOutlet weak var labelText: UILabel!
    
    var cellModel: AnswerModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension AnswerCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let model = model as? AnswerModel else { return }
        self.cellModel = model
        
        labelText.attributedText = "<style>p {margin: 0;}</style><div style='color: #8e8e93;'>\(model.textHeader)</div>".htmlToAttributedString
        labelText.font = UIFont(name: "HelveticaNeue", size: 14)
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
