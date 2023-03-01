//
//  SceneLoader.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 01/03/23.
//

import UIKit

protocol SceneLoader: AnyObject {
    associatedtype Destination = Identifiable
    
    func makeScene(_ destination: Destination)
    
    init(_ window: UIWindow)
}
