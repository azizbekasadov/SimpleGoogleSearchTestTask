//
//  AppSceneLoader.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 01/03/23.
//

import UIKit

final class AppSceneLoader: SceneLoader {
    enum Destination: Int, Identifiable {
        case home
        case onboarding
        case tabbar
        case auth
        
        var id: Int {
            return self.rawValue
        }
    }
    
    private unowned var window: UIWindow
    
    required init(_ window: UIWindow) {
        self.window = window
    }
    
    func makeScene(_ destination: Destination) {
        switch destination {
        case .home:
            window.rootViewController = DiscoverBuilder.build()
        default:
            window.rootViewController = UIViewController()
        }
        
        window.makeKeyAndVisible()
    }
    
}

