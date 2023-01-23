//
//  Router.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 23/01/23.
//

import UIKit

protocol Router: AnyObject {
    associatedtype Destination
    
    func routeTo(destination: Destination)
}
