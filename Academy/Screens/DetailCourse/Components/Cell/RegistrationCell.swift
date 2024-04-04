//
//  RegistrationCell.swift
//  Academy
//
//  Created by MovchanArtemiy on 05.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

class RegistrationCell: UITableViewCell {
    
    @IBOutlet weak var registrationButton: UIButton!
    var registrationFlag: Bool?
    var tapRegistration: ((Bool) -> Void)?
    
    @IBAction func registrationTapped(_ sender: Any) {
        tapRegistration?(true)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registrationButton.isHidden = true
    }
    
    
}

extension RegistrationCell: CellModelConfigurable {
    func config(model: CellModel) {
         guard let model = model as? RegistrationCellModel else { return }
         registrationFlag = model.registration
         
         if registrationFlag == true {
             registrationButton.isHidden = false
         }
     }

}
    


