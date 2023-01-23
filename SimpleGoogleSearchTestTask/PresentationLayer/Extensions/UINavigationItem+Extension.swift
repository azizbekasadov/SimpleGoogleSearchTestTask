//
//  UINavigationItem+Extension.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 23/01/23.
//

import UIKit
import ObjectiveC

fileprivate var _UINavigationItem_localizedKey: UInt8 = 0

extension UINavigationItem {
    @IBInspectable public var localizedKey: String {
        get {
            return objc_getAssociatedObject(self, &_UINavigationItem_localizedKey) as? String ?? ""
        }
        set(key) {
            objc_setAssociatedObject(self,
                                     &_UINavigationItem_localizedKey,
                                     key,
                                     objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            title = key.localized
        }
    }

    public func localize() {
        if !localizedKey.isEmpty {
            title = localizedKey.localized
        }
    }
}
