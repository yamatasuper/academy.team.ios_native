//
//  ScheduleCell.swift
//  Academy
//
//  Created by MovchanArtemiy on 03.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

class ScheduleCell: UITableViewCell {
    var closureInSchedule: ((String) -> Void)?
    var button = DropDownBtn()
    var title = ""
    var status: Bool = false
    @IBOutlet weak var viewButton: UIView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    //test(status: status)
    }
    


}

extension ScheduleCell: CellModelConfigurable {
    func config(model: CellModel) {
        var schedule = Dictionary<String,String>()
        var keysSchedule = [String]()
        var valuesSchedule = [String]()
        button = DropDownBtn.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        button.setTitle("Выберите направление", for: .normal)

    
        button.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(button)
        
        //button.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        //button.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 377).isActive = true
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        guard let model = model as? ScheduleCellModel else { return }
    
        schedule = model.scheduleArray
        for (key, value) in schedule {
            keysSchedule.append(key)
            valuesSchedule.append(value)
        }
        
        button.dropView.dropDownOptions = keysSchedule
        button.dropView.valueDownOptions = valuesSchedule
        
        func test(status: Bool) {
            //heightConstraint.constant = 500
            switch status {
                case  false:
                    print("button close")
                    self.heightConstraint.constant = viewButton.frame.size.height - 50
                case  true:
                    print("button open")
                heightConstraint.constant = viewButton.frame.size.height + 50
                default:
                    break
            }
        }
        
        button.closureOpenView = { [weak self] status in
            guard let `self` = self else { return }
        }
        
        button.buttonTapped = { [weak self] status in
                guard let `self` = self else { return }
                //self.closureInSchedule?(schedule)
            //self.takeConstraint(bool: status)
            test(status: status)
        }

        button.tapButton = { [weak self] schedule in
            guard let `self` = self else { return }
            self.closureInSchedule?(schedule)
        }
        
    }
}

