//
//  GroupCell.swift
//  Academy
//
//  Created by MovchanArtemiy on 22.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

class GroupCoursesCell: UITableViewCell {
    
    @IBOutlet weak var nameCourse: UILabel!
    @IBOutlet weak var statusCourse: UILabel!
    var id: Int = 0
    
    var tapDetail: ((Int) -> Void)?
    
    
    @IBAction func tapToHeaderAction(_ sender: Any) {
        tapDetail?(id)
    }
    
    
    override func awakeFromNib() {
         super.awakeFromNib()

     }
    

}


extension GroupCoursesCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let model = model as? GroupCourseCellModel else { return }
        nameCourse.text = model.nameCourse
        statusCourse.text = model.statusCourse
        id = model.id

       
    }
}
