//
//  FilterCell.swift
//  Academy
//
//  Created by MovchanArtemiy on 30.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

class FilterCell: UITableViewCell {
    
    var tapFilter: ((Bool) -> Void)?
    var filterCountTapped: Int = 0
    
    
    @IBOutlet weak var filterButton: UIButton!

    @IBAction func filterAction(_ sender: Any) {
        scheduleNotification(inSeconds: 7) { (success) in
            if success {
                print("pushwork")
            } else {
                print("pushfailed")
            }
        }
        
        
        filterCountTapped += 1
        var balance = filterCountTapped % 2
        
        if balance == 0 {
            tapFilter?(false)
        } else {
            tapFilter?(true)
        }
        
        
    }
    
    func scheduleNotification(inSeconds seconds: TimeInterval, completion: (Bool) -> ()) {
        removeNotifications(withIdentifiers: ["myIdentifier"])
        
        let date = Date(timeIntervalSinceNow: seconds)
        print(Date())
        print(date)
        
        let content = UNMutableNotificationContent()
        content.title = "Сегодня первое занятие курса"
        content.body = "Ждем в Академии разработки в <время старта>. До встречи!"
        //content.sound = UINotificatS
        
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.month, .day, .hour,  .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        let request = UNNotificationRequest(identifier: "myIdentifier", content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        center.add(request, withCompletionHandler: nil)
        
    }
    
    func removeNotifications(withIdentifiers identifiers: [String]) {
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
    
    deinit {
        removeNotifications(withIdentifiers: ["myIdentifier"])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

extension FilterCell: CellModelConfigurable {
    func config(model: CellModel) {
        
        guard let model = model as? FilterCellModel else { return }
        
    }
}
