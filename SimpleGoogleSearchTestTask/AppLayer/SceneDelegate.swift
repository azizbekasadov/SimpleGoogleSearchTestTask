//
//  SceneDelegate.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 23/01/23.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else {
            fatalError("Unable to instantiate window scene")
        }
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        self.window?.windowScene = windowScene
        self.window?.rootViewController = DiscoverBuilder.build().withNavigation()
        self.window?.makeKeyAndVisible()
    }
}

