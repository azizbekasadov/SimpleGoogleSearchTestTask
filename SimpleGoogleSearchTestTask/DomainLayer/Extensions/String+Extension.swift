//
//  String+Extension.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 23/01/23.
//

import Foundation

extension String {
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
