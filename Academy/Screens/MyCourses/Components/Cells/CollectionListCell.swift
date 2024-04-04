//
//  CollectionListCell.swift
//  Academy
//
//  Created by Sergey Dimitriev on 27.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

open class CollectionListCell: UITableViewCell {
    @IBOutlet weak var collectionList: UICollectionView!
    var cellModel: CollectionListModel?
    var collectionManager: MyCoursesCollectionManager!
    
    var colectionModels: [CollectionCellModel] = []
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionManager = MyCoursesCollectionManager(collectionView: collectionList)
    }
}
extension CollectionListCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let model = model as? CollectionListModel else { return }
        
        for i in 0...model.list!.count-1{
            let course = model.list![i]
            colectionModels.append(
                CourseCollectionModel(item: course)
//title: course.title!,
//date_start: course.date_start ?? "",
//date_completion: course.date_completion ?? "",
//listened: course.listened ?? 0,
//completed: course.completed ?? 0
            )
        }
        
        collectionManager.setModels(colectionModels)
    }
}
