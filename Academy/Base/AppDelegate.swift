//
//  AppDelegate.swift
//  Academy
//
//  Created by MovchanArtemiy on 10.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit
import CoreData
import YandexMapKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let MAPKIT_API_KEY = "30eef3e2-811d-401a-9b7c-2ad0a2101b48"
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        YMKMapKit.setApiKey(MAPKIT_API_KEY)
        
        let center = UNUserNotificationCenter.current()
            let options: UNAuthorizationOptions = [.alert, .badge, .sound]
            center.requestAuthorization(options: options, completionHandler: { authorized, error in
                if authorized {
                    application.registerForRemoteNotifications()
                }
            })
        
        
        return true
    }
}

