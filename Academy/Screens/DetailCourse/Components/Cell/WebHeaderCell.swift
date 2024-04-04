//
//  WebHeaderCell.swift
//  Academy
//
//  Created by MovchanArtemiy on 10.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

class WebHeaderCell: UITableViewCell {
    
    @IBOutlet weak var textHeader: UILabel!
    @IBOutlet weak var arrowStatus: UIImageView!
    var tapStatus: Bool = false
    
    var closureTap: ((String, Int, Bool) -> Void)?
    var id:Int = 0
    var headerCountTapped: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func webTap(_ sender: UIButton) {
        headerCountTapped += 1
        if headerCountTapped % 2 == 0 {
            closureTap?(self.textHeader.text!, self.id, false)
            arrowStatus.image = UIImage(named: "arrow_down")
        } else {
            closureTap?(self.textHeader.text!, self.id, true)
            arrowStatus.image = UIImage(named: "arrow_up")
        }
        
        print("obla \(self.textHeader.text)")
    }
    
}

extension WebHeaderCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let model = model as? WebHeaderCellModel else { return }
        self.textHeader.text = model.textHeader
        self.id = model.id
    }
    
}
