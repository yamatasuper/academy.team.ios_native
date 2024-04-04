//
//  DetailCourseViewController.swift
//  Academy
//
//  Created by Sergey Dimitriev on 21.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

class DetailCourseViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var tableManager: DetailCourseTableManager!
    var output: DetailCourseViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableManager = DetailCourseTableManager(tableView: tableView)
        tableManager.output = output
        
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        output.loadDetail()
        output.didViewLoad(navigationController)

    }
}

extension DetailCourseViewController: DetailCourseViewInput {
    func setModel(model: CellModel, row: Int) {
        tableManager!.set(model: model, row: row)
        tableView.reloadData()
    }

    func setData(models: [CellModel]) {
        tableManager?.set(models: models)
        tableView.reloadData()
    }
}
