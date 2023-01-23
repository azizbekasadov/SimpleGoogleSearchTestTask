//
//  UIViewController+Extension.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 23/01/23.
//

import UIKit

extension UIViewController {
    func withNavigation() -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: self)
        return navigationController
    }
}
