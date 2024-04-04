//
//  TableCoursesCell.swift
//  Academy
//
//  Created by MovchanArtemiy on 28.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

class TableCoursesCell: UITableViewCell {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
           super.awakeFromNib()
           setCells()
       }
    
    func setCells() {
        
        
        
    }

}

extension TableCoursesCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let model = model as? TableCoursesCellModel else { return }

    }
    
}

extension TableCoursesCell: DetailCourseViewInput {
    func setData(models: [CellModel]) {
    }
    
    func setModel(model: CellModel, row: Int) {
    }
    

    
}
