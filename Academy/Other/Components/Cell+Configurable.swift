//
//  TableViewProtocols.swift
//  Academy
//
//  Created by Sergey Dimitriev on 13.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

protocol CellModel {
    var reuseIdentifier: String { get }
//    var height: Int { get }
}

extension CellModel {
    var height: Int { return 0 }
}

protocol CellModelConfigurable {
    func config(model: CellModel)
}

typealias ConfigurableCell = UITableViewCell & CellModelConfigurable
