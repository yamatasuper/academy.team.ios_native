//
//  Button.swift
//  Academy
//
//  Created by MovchanArtemiy on 06.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

protocol DropDownProtocol {
    func dropDownPressed(key : String, value: String)
}

class DropDownBtn: UIButton, DropDownProtocol {
var tapButton: ((String) -> Void)?
var closureOpenView: ((Bool) -> Void)?
var buttonTapped: ((Bool) -> Void)?
    func dropDownPressed(key: String, value: String) {
        
        self.setTitle(value, for: .normal)
        self.dismissDropDown()
        tapButton?(key)
        //closureOpenView?(true)
        
    }

    var dropView = DropDownView()

    var height = NSLayoutConstraint()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = UIColor.gray

        dropView = DropDownView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        dropView.delegate = self
        dropView.translatesAutoresizingMaskIntoConstraints = false
    }

    override func didMoveToSuperview() {
        self.superview?.addSubview(dropView)
        self.superview?.bringSubviewToFront(dropView)
        dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        height = dropView.heightAnchor.constraint(equalToConstant: 0)
    }

    var isOpen = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isOpen == false {
            isOpen = true

            NSLayoutConstraint.deactivate([self.height])

            if self.dropView.tableView.contentSize.height > 120 {
                buttonTapped?(true)
                self.height.constant = 120
            } else {
        
                self.height.constant = self.dropView.tableView.contentSize.height
            }


            NSLayoutConstraint.activate([self.height])

            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.layoutIfNeeded()
                self.dropView.center.y += self.dropView.frame.height / 2
            }, completion: nil)

        } else {
            isOpen = false
buttonTapped?(false)
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.center.y -= self.dropView.frame.height / 2
                self.dropView.layoutIfNeeded()
            }, completion: nil)

        }
    }

    func dismissDropDown() {
        isOpen = false
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate([self.height])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.dropView.center.y -= self.dropView.frame.height / 2
            self.dropView.layoutIfNeeded()
        }, completion: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class DropDownView: UIView, UITableViewDelegate, UITableViewDataSource  {
    var dropDownOptions = [String]()
    var valueDownOptions = [String]()
    var tableView = UITableView()

    var delegate : DropDownProtocol!

    override init(frame: CGRect) {
        super.init(frame: frame)

        tableView.backgroundColor = UIColor.gray
        self.backgroundColor = UIColor.gray


        tableView.delegate = self
        tableView.dataSource = self

        tableView.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(tableView)

        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropDownOptions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        cell.textLabel?.text = valueDownOptions[indexPath.row]
        cell.backgroundColor = UIColor.gray
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate.dropDownPressed(key: dropDownOptions[indexPath.row], value: valueDownOptions[indexPath.row])
        self.tableView.deselectRow(at: indexPath, animated: true)
    }

}


