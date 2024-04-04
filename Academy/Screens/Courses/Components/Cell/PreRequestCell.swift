//
//  PreRequest.swift
//  Academy
//
//  Created by MovchanArtemiy on 28.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

class PreRequestCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var pickerData: [String] = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        pickerData = ["Курс 1", "Курс 2", "Курс 3", "Курс 4", "Курс 5"]
        
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
    
}

extension PreRequestCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let model = model as? PreRequestCellModel else { return }
        
        
    }
}
