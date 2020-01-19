//
//  AppDelegate.swift
//  testF
//
//  Created by Максим Шаптала on 19.01.2020.
//  Copyright © 2020 Максим Шаптала. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UserDefaults.standard.register(defaults: [
            UDKeys.f1.min: 1, UDKeys.f1.max: 30,
            UDKeys.f1.def.min: 1, UDKeys.f1.def.max: 30,
            UDKeys.f2.min: 1, UDKeys.f2.max: 30,
            UDKeys.f2.def.min: 1, UDKeys.f2.def.max: 30,
            UDKeys.f3.min: 18, UDKeys.f3.max: 20,
            UDKeys.f3.def.min: 18, UDKeys.f3.def.max: 20,
            UDKeys.f4.min: 7, UDKeys.f4.max: 14,
            UDKeys.f4.def.min: 7, UDKeys.f4.def.max: 14
        ])
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        Storage.shared.saveToUD()
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

