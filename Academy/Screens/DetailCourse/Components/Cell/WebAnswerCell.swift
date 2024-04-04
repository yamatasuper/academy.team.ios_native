//
//  WebAnswerCell.swift
//  Academy
//
//  Created by MovchanArtemiy on 10.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import WebKit

class WebAnswerCell: UITableViewCell, WKNavigationDelegate {
    //@IBOutlet weak var webView: WKWebView!

    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var textWrap: UIView!
    //@IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    var cellModel: WebAnswerCellModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //webView.navigationDelegate = self
        
        textWrap.layer.shadowColor = UIColor.black.cgColor
        textWrap.layer.shadowOpacity = 0.3
        textWrap.layer.shadowOffset = .zero
        textWrap.layer.shadowRadius = 3
    }
}

extension WebAnswerCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let model = model as? WebAnswerCellModel else { return }
        self.cellModel = model
        
        labelText.attributedText = "<div style='font-family: Roboto-Light;font-size: 16px;'>\(model.textHeader)</div>".htmlToAttributedString
        //print("modeltext \(model.textHeader)")
        
        
//        self.webView.loadHTMLString("<html><head><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'><style>body{font-size: 18px;color:#000000;margin:0;}html{background: #ededed;}</style></head><body><main>\(model.textHeader)</main></body></html>", baseURL: nil)
//        heightConstraint.constant = 24 + model.textHeader.heightWithConstrainedWidth(
//            width: webView.frame.size.width,
//            font: UIFont(name: "HelveticaNeue-UltraLight", size: 18)!
//        )
    }
}


