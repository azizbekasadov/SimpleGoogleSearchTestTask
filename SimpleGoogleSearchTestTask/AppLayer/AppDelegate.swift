//
//  AppDelegate.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 23/01/23.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    internal typealias LaunchOptions = [UIApplication.LaunchOptionsKey: Any]
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: LaunchOptions?) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration",
                                    sessionRole: connectingSceneSession.role)
    }
}

