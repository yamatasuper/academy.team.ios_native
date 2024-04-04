//
//  SocialCell.swift
//  Academy
//
//  Created by Sergey Dimitriev on 24.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

open class SocialCell: UITableViewCell {
    @IBOutlet weak var vkIcon: UIButton!
    @IBOutlet weak var facebookIcon: UIButton!
    @IBOutlet weak var instagramIcon: UIButton!
    @IBOutlet weak var telegramIcon: UIButton!
    
    var cellModel: SocialLinksModel?
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        vkIcon.setBackgroundImage(UIImage(named: "icon-vk"), for: UIControl.State.normal)
        facebookIcon.setBackgroundImage(UIImage(named: "icon-fb"), for: UIControl.State.normal)
        instagramIcon.setBackgroundImage(UIImage(named: "icon-inst"), for: UIControl.State.normal)
        telegramIcon.setBackgroundImage(UIImage(named: "icon-tg"), for: UIControl.State.normal)
        vkIcon.tintColor = UIColor.red
    }
    @IBAction func vkIconTap(_ sender: UIButton) {
        guard let url = URL(string: "/") else { return }
        UIApplication.shared.open(url)
    }
    @IBAction func facebookIconTap(_ sender: UIButton) {
        guard let url = URL(string: "/") else { return }
        UIApplication.shared.open(url)
    }
    @IBAction func instagramIconTap(_ sender: UIButton) {
        guard let url = URL(string: "/") else { return }
        UIApplication.shared.open(url)
    }
    @IBAction func telegramIconTap(_ sender: UIButton) {
        guard let url = URL(string: "/") else { return }
        UIApplication.shared.open(url)
    }
}

extension SocialCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let model = model as? SocialLinksModel else { return }
        self.cellModel = model
    }
}
