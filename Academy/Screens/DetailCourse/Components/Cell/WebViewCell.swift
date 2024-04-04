//
//  WebViewCell.swift
//  Academy
//
//  Created by MovchanArtemiy on 20.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class WebViewCell: UITableViewCell {
    @IBOutlet weak var textWeb: UILabel!
    
    @IBOutlet weak var headText: UILabel!
    
    @IBOutlet weak var imageArrow: UIImageView!
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var stackView: UIStackView!
    
    
    @IBOutlet weak var loaderIndicator: UIActivityIndicatorView!
    //var loaderIndicator = UIActivityIndicatorView()
    
    //let webVW = WKWebView()
    
    @IBOutlet weak var upView: UIView!
    @IBOutlet weak var downView: UIView!
    @IBOutlet weak var cellHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tapHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var descriptionHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var hiddenLabel: UILabel!
    @IBOutlet weak var webViewHeight: NSLayoutConstraint!
    
    var tapClosure: ((Int) -> Void)?
    var headerCountTapped: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        webVW.navigationDelegate = self
        let width = downView.frame.size.width
        descriptionHeightConstraint.constant = width
//        webVW.frame = downView.bounds
//        webVW.frame.size.height = width
//        webVW.backgroundColor = UIColor.white
        
        //downView.addSubview(textWeb)
        downView.addSubview(loaderIndicator)
        
        backgroundColor = UIColor.clear
        
        self.view.layer.borderWidth = 1
        self.view.layer.cornerRadius = 3
        self.view.layer.borderColor = UIColor.white.cgColor
        self.view.layer.masksToBounds = true
        
        self.layer.shadowOpacity = 0.48
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 8
        self.layer.shadowColor =  UIColor.black.cgColor
        self.layer.masksToBounds = false
        
    }
    
    
    @IBAction func tapToHeaderAction(_ sender: Any) {
        tapClosure?(((self.superview as? UITableView)?.indexPath(for: self)!.row)!)
        headerCountTapped += 1
        
    }
    
    func buildHTML(text: String) -> String {
        let head = "<!DOCTYPE html><html><head><meta name=viewport content=initial-scale=1.0/><style>"
        //var css = ""
        let styleBody = "</style></head><body>"
        let queryText = text
        let bodyHtml = "</body></html>"
        
        return (head + styleBody + queryText + bodyHtml)
    }
}

extension WebViewCell: CellModelConfigurable {
    func config(model: CellModel) {
        
        guard let model = model as? WebViewCellModel else { return }
        
        headText.text = model.headText
        //let url = buildHTML(text: model.webView)
        print("modeltext \(model.webView)")
        //webVW.loadHTMLString(url, baseURL: nil)
        
        //textWeb.attributedText = "<div style='font-family: Roboto-Light;font-size: 16px;'>\(model.webView)</div>".htmlToAttributedString
        
        textWeb.attributedText = "<div style='font-family: Roboto-Light;font-size: 16px;'>\(model.webView)</div>".htmlToAttributedString
        
//        var balance = headerCountTapped % 2
//        if balance == 0 {
//            imageArrow.image = UIImage(named: "arrow_down")
//            descriptionHeightConstraint.constant =  hiddenLabel.frame.size.height - textWeb.frame.size.height
//            cellHeightConstraint.constant = descriptionHeightConstraint.constant + 44
//
//        } else {
//            imageArrow.image = UIImage(named: "arrow_up")
//            descriptionHeightConstraint.constant =  hiddenLabel.frame.size.height + textWeb.frame.size.height
//            cellHeightConstraint.constant = descriptionHeightConstraint.constant + 44
//
//        }
        descriptionHeightConstraint.constant = model.isExpanded ? hiddenLabel.frame.size.height + textWeb.frame.size.height : 0

        cellHeightConstraint.constant = descriptionHeightConstraint.constant + 44
        
    }
}

extension WebViewCell: WKNavigationDelegate, UIWebViewDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        loaderIndicator.startAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loaderIndicator.isHidden = true
//        webVW.frame.size.height = 1
//        webVW.frame.size = webVW.scrollView.contentSize
    }
    
}

