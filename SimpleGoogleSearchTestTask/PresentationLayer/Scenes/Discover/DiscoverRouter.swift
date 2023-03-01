//
//  DiscoverRouter.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 23/01/23.
//

import UIKit

protocol DiscoverRoutingLogic: Router {}

final class DiscoverRouter {
    weak var viewController: DiscoverViewController?
}

extension DiscoverRouter: DiscoverRoutingLogic {
    enum Destination {
        case details
        case error
    }
    
    func routeTo(destination: Destination) {
        switch destination {
        case .details: break
        case .error: break
        }
    }
}
