//
//  CourseCell.swift
//  Academy
//
//  Created by MovchanArtemiy on 10.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class CourseCell: UITableViewCell, UINavigationControllerDelegate {
    
    @IBOutlet weak var nameCourse: UILabel!
    @IBOutlet weak var statusCourse: UILabel!
    var tableName: String = ""
    @IBOutlet weak var descriptionCourse: UILabel!
    
    @IBOutlet weak var stackSlide: UIStackView!
    @IBOutlet weak var tapView: UIView!
    @IBOutlet weak var tapHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var cellHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var view: UIView!
    
    
    var tapClosure: ((Int, String) -> Void)?
    var tapDetail: ((Int, String) -> Void)?

    
    var id: Int = 0
    
    private(set) weak var transitionHandler: TransitionHandlerProtocol?
    
    @IBAction func tapToHeaderAction(_ sender: Any) {
        tapDetail?(id, tableName)
        tapClosure?(id, tableName)
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
    
    func buildHTML(text: String) -> String {
        let head = "<!DOCTYPE html><html><head><meta name=viewport content=initial-scale=1.0/><style>"
        //var css = ""
        let styleBody = "</style></head><body>"
        let queryText = text
        let bodyHtml = "</body></html>"
        
        return (head + styleBody + queryText + bodyHtml)
    }
    
}

extension CourseCell: CellModelConfigurable {
    func config(model: CellModel) {
        
        guard let model = model as? CoursesListModel else { return }
        
        nameCourse.text = model.nameCourse
        statusCourse.text = model.statusCourse
        descriptionCourse.text = model.rightDescription
        
        id = model.id
        tableName = model.tableName        
        
    }
}

