//
//  WebViewCellModel.swift
//  Academy
//
//  Created by MovchanArtemiy on 20.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class WebViewCellModel: CellModel {
    var reuseIdentifier = "WebViewCell"
    var headText: String
    var webView: String
    var isExpanded: Bool
    
    init(reuseIdentifier: String, headText: String, webView: String, isExpanded: Bool) {
        self.reuseIdentifier = reuseIdentifier
        self.headText = headText
        self.webView = webView
        self.isExpanded = isExpanded

    }
}

