//
//  CollectionCell+Configurable.swift
//  Academy
//
//  Created by Sergey Dimitriev on 27.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

protocol CollectionCellModel {
    var reuseIdentifier: String { get }
}

protocol CollectionCellModelConfigurable {
    func config(model: CollectionCellModel)
}

typealias ConfigurableCollectionCell = UICollectionViewCell & CollectionCellModelConfigurable
