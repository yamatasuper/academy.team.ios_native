//
//  UIButton+roundedButton.swift
//  Academy
//
//  Created by Sergey Dimitriev on 15.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

extension UIButton{
    func roundedButton(){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
            byRoundingCorners: [.bottomRight , .topRight],
            cornerRadii: CGSize(width: 7, height: 7))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
}
