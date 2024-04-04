//
//  UserInfoCell.swift
//  Academy
//
//  Created by Sergey Dimitriev on 27.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

open class UserInfoCell: UITableViewCell {
    var cellModel: UserInfoModel?
    @IBOutlet weak var labelText: UILabel!
    
    open override func awakeFromNib() {
        super.awakeFromNib()
    }
}
extension UserInfoCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let model = model as? UserInfoModel else { return }
        
        self.labelText.attributedText = "<span style='color: #0bcf6b;'>\(model.title)</span> \(model.text)".htmlAttributedString()
        self.labelText.font = UIFont(name: "Roboto-Bold", size: 18)
    }
}

extension String {
    func htmlAttributedString() -> NSAttributedString? {
        guard let data = self.data(using: String.Encoding.utf16, allowLossyConversion: false) else { return nil }
        guard let html = try? NSMutableAttributedString(
            data: data,
            options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil) else { return nil }
        return html
    }
}
