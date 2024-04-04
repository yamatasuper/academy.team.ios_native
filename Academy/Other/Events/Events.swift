//
//  Events.swift
//  Academy
//
//  Created by Sergey Dimitriev on 14.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

enum Events: Hashable {
    case UnauthEvent
    case MessageEvent
    
    case ShowLoader
    case HideLoader
}

extension Events {
    
    func getEventTag() -> String {
        return "\(hashValue)"
    }
    
    func post() {
        EventBus.post(getEventTag())
    }
    
    func post(_ sender: Any?) {
        EventBus.post(getEventTag(), sender: sender)
    }
    
}
