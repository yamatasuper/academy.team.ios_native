//
//  MyCoursesCollectionManager.swift
//  Academy
//
//  Created by Sergey Dimitriev on 27.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

class MyCoursesCollectionManager: NSObject {
    weak var collectionView: UICollectionView!
    
    private var dataSource: [CollectionCellModel] = []
    
    weak var output: MyCoursesViewOutput?
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func createCells() {
        collectionView.register(UINib(nibName: "CourseCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CourseCollectionCell")
    }

    func setModels(_ models: [CollectionCellModel]) {
        self.createCells()
        self.dataSource = models
        collectionView.reloadData()
    }
}

extension MyCoursesCollectionManager: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let paddingSpace = sectionInsets.left + sectionInsets.right
        let widthPerItem = collectionView.bounds.width*0.6// - paddingSpace
        return CGSize(width: widthPerItem, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = dataSource[indexPath.row]

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: model.reuseIdentifier, for: indexPath) as? ConfigurableCollectionCell else {
            return UICollectionViewCell()
        }
        cell.config(model: model)
        cell.backgroundColor = .clear
        configure(cell: cell, model: model)
        return cell
    }
}

extension MyCoursesCollectionManager {
    func configure(cell: ConfigurableCollectionCell, model: CollectionCellModel) {
        switch cell {
//            case let cell as QuestionCell:
//                cell.closureTap = { [weak self] pos in
//                    guard let `self` = self else { return }
//                    self.output?.questionTapped(pos: pos)
//                }
//                break
        default:
            break
        }
    }
}
