//
//  NSNotifications.Name+Extension.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 23/01/23.
//

import Foundation

extension Notification.Name {
    static let didChangeLanguage = Notification.Name("didChangeLanguage")
    static let didChangeColor = Notification.Name("didChangeColor")
    static let didClearCache = Notification.Name("didClearCache")
}
