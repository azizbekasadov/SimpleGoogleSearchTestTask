//
//  SceneDelegate.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 23/01/23.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    private(set) var sceneLoader: (any SceneLoader)?
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else {
            fatalError("Unable to instantiate window scene")
        }
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        sceneLoader = AppSceneLoader(window)
        (sceneLoader as? AppSceneLoader)?.makeScene(.home)
    }
}

