//
//  SummerCourses.swift
//  Academy
//
//  Created by MovchanArtemiy on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

class SummerCoursesCell: UITableViewCell {
    
    @IBOutlet weak var nameCourse: UILabel!
    @IBOutlet weak var statusCourse: UILabel!
    
    var tapClosure: ((Int) -> Void)?
    
    @IBOutlet weak var cellHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tapHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var descriptionHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var hiddenLabel: UILabel!
    
    @IBAction func tapToHeaderAction(_ sender: Any) {
           tapClosure?(((self.superview as? UITableView)?.indexPath(for: self)!.row)!)
           print("closuree")
       }
    
    override func awakeFromNib() {
         super.awakeFromNib()

     }
    

}

extension SummerCoursesCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let model = model as? SummerCoursesCellModel else { return }
        nameCourse.text = model.nameCourse
        statusCourse.text = model.statusCourse
        
        descriptionHeightConstraint.constant = model.isExpanded ? hiddenLabel.frame.size.height + 44 : 2600
               
            cellHeightConstraint.constant = descriptionHeightConstraint.constant + 44

       
    }
}
